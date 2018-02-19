class HealthController < ApplicationController
  def ping
    head 200
  end

  def health
    render json: {
      application_running: true,
      active_record_connected: ActiveRecord::Base.connection.active?,
      service_name: 'grocery_list_service'
    }
  end
end
