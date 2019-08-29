# frozen_string_literal: true

require 'cgi'
require 'rom/core'
require 'rom/http'
require 'rom/transformer'

require_relative 'github/types'
require_relative 'github/uri_helper'

require_relative 'github/associations/one_to_many'
require_relative 'github/associations/one_to_one'

require_relative 'github/schema'
require_relative 'github/resources/base'
require_relative 'github/resources/repositories'
require_relative 'github/resources/pull_requests'

require_relative 'github/mappers/pull_request_mapper'

module ROM
  module Github
    class Error < StandardError; end

    def self.create_container(*args, **opts)
      config = if args.first.is_a?(ROM::Configuration)
                 args.first
               else
                 options = { uri: 'https://api.github.com', handlers: :json }
                 options = Transproc::HashTransformations[:deep_merge].call(options, opts)
                 ROM::Configuration.new(:http, options)
               end

      config.register_relation(
        ROM::Github::Resources::Repositories,
        ROM::Github::Resources::PullRequests
      )

      config.register_mapper(ROM::Github::Mappers::PullRequestMapper)

      ROM.container(config)
    end
  end
end
