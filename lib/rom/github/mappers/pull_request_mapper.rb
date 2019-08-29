module ROM
  module Github
    module Mappers
      class PullRequestMapper < ROM::Transformer
        relation :pull_requests
        register_as :github

        map do
          copy_keys(base: :base_repo_id)
          copy_keys(base: :base_repo_name)
          map_value(:base_repo_id, &:base_repo_id)
          map_value(:base_repo_name, &:base_repo_name)

          symbolize_keys
        end

        def base_repo_id(base)
          base[:repo][:id]
        end

        def base_repo_name(base)
          base[:repo][:full_name]
        end
      end
    end
  end
end
