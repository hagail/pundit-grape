module Grape
  module Pundit
    module Exceptions
      class AuthorizationError < Grape::Exceptions::Base
        def initialize
          super message: "API Authorization Failed.", status: 403
        end
      end
    end
  end
end