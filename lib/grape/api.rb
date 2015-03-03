module Grape
  class API
    include Grape::Pundit::Authorization
  end
end