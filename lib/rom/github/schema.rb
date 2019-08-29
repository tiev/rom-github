module ROM
  module Github
    class Schema < ROM::HTTP::Schema
      def finalize_associations!(relations:)
        super do
          associations.map do |definition|
            ROM::Github::Associations.const_get(definition.type).new(definition, relations)
          end
        end
      end
    end
  end
end
