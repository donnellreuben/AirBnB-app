# frozen_string_literal: true

module Host
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
      authorize current_user, policy_class: HostPolicy
      @properties = current_user.properties
    end
  end
end
