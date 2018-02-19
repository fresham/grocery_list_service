require 'rails_helper'

RSpec.describe HealthController, type: :controller do

  describe "GET #ping" do
    it "returns a success response" do
      get :ping
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #health" do
    it "returns a success response" do
      get :health
      expect(response).to have_http_status(:success)
    end

    it "returns application status" do
      get :health
      response_body = JSON.parse(response.body)
      expect(response_body['application_running']).to be_truthy
    end

    it "returns active record status" do
      get :health
      response_body = JSON.parse(response.body)
      expect(response_body['active_record_connected']).to be_truthy
    end

    it "returns service name" do
      get :health
      response_body = JSON.parse(response.body)
      expect(response_body['service_name']).to eq('grocery_list_service')
    end
  end
end
