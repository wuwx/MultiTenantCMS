class Sites::Settings::ApplicationController < ::ApplicationController
  before_action :authenticate_user!
end
