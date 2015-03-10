module Grape
  module Pundit
    module Authorization
      extend ActiveSupport::Concern

      module ClassMethods
        def authorize(&block)
          authorization = ->(_) {
            instance_eval(&block)
            # authorized = instance_eval(&block)
            # unless authorized
            #   fail Grape::Pundit::Exceptions::AuthorizationError
            # end
          }

          namespace_stackable(:after_validations, authorization)
        end
      end
    end
  end
end