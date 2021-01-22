module Gamayun 
  module Admin
    class BaseController < ::Gamayun::ApplicationController
      before_action :authenticate_user!
    end
  end
end
