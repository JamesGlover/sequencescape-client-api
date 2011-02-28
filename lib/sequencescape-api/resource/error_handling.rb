require 'active_model/naming'
require 'active_model/translation'

# Uh, ok, so why do I have to include these if I'm not going to use them!?!!
require 'active_model/deprecated_error_methods'
require 'active_model/errors'

class Sequencescape::Api
  class ResourceInvalid < Error
    def initialize(resource)
      super('Resource is reported as invalid by the server')
      @resource = resource
    end

    attr_reader :resource
  end
end

module Sequencescape::Api::Resource::ErrorHandling
  def self.included(base)
    base.class_eval do
      extend ActiveModel::Translation
      attr_reader :errors
    end
  end

  def initialize(*args, &block)
    super
    @errors = ActiveModel::Errors.new(self)
  end
end