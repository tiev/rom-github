module ROM
  module Github
    module UriHelper
      def escape_repository_name(full_name)
        full_name.to_s.split('/').take(2).map do |part|
          CGI.escape(part)
        end.join('/')
      end
    end
  end
end
