module ROM
  module Github
    module Resources
      class PullRequests < Resources::Base
        include UriHelper

        schema(:pulls, as: :pull_requests) do
          attribute :id, Types::Integer
          attribute :number, Types::Integer
          attribute :state, Types::String.constrained(included_in: %w[open closed])
          attribute :title, Types::String
          attribute :body, Types::String
          attribute :created_at, Types::DateTime
          attribute :merged, Types::Bool.meta(omittable: true)
          attribute :merged_at, Types::DateTime
          attribute :base, Types::Hash.schema(
            repo: Types::Hash.schema(
              id: Types::Integer,
              full_name: Types::String
            ).with_key_transform(&:to_sym)
          ).with_key_transform(&:to_sym)

          primary_key :id
        end

        def for_repo(name)
          with_base_path("repos/#{escape_repository_name(name)}/pulls")
        end

        def by_number(number)
          append_path(CGI.escape(number.to_s))
        end

        #--- Associations ---#
        def for_repos(_assoc, repos)
          repos.map do |repo|
            for_repo(repo[:full_name]).map_with(:github)
          end.flatten
        end
      end
    end
  end
end
