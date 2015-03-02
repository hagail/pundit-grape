require "pundit/grape/version"


module Grape
  module Pundit
    module Authorization
      extend ActiveSupport::Concern

      module ClassMethods
        def authorize(&block)
          authorization = ->(_) {
            authorized = instance_eval(&block)
            unless authorized
              fail Grape::Pundit::Exceptions::AuthorizationError
            end
          }

          namespace_stackable(:after_validations, authorization)
        end
      end
    end

    module Exceptions
      class AuthorizationError < Grape::Exceptions::Base
        def initialize
          super message: "API Authorization Failed.", status: 401
        end
      end
    end
  end

  class API
    include Grape::Pundit::Authorization
  end

  class Endpoint
    include Pundit
  end
end
