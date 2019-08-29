module ROM
  module Github
    module Resources
      class Base < ROM::Relation[:http]
        schema_class Github::Schema

        def page(number)
          add_params(page: number)
        end

        def per_page(number)
          add_params(per_page: number)
        end
      end
    end
  end
end
