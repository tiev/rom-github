module ROM
  module Github
    module Resources
      class Repositories < Resources::Base
        include UriHelper

        schema(:repos, as: :repositories) do
          attribute :id, Types::Integer
          attribute :name, Types::String
          attribute :full_name, Types::String
          attribute :private, Types::Bool
          attribute :description, Types::String

          primary_key :id

          associations do
            has_many :pull_requests, combine_keys: { id: :base_repo_id }, override: true, view: :for_repos
          end
        end

        def for_org(name)
          with_base_path("orgs/#{CGI.escape(name)}/repos")
        end

        def for_user(name)
          with_base_path("users/#{CGI.escape(name)}/repos")
        end

        def mine
          with_base_path('user/repos')
        end

        def by_name(name)
          append_path(escape_repository_name(name))
        end
      end
    end
  end
end
