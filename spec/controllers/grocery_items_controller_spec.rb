require 'rails_helper'

RSpec.describe GroceryItemsController, type: :controller do

  let(:valid_attributes) { { name: 'Milk' } }
  let(:invalid_attributes) { { name: nil } }

  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }
  let(:user) do
    User.create!(
      email: 'user@example.com', 
      password: 'admin',
      password_confirmation: 'admin'
    )
  end

  before(:example) do
    request.headers.merge!("Authorization" => "Bearer #{jwt}")
  end

  describe "GET #index" do
    it "returns a success response" do
      grocery_item = GroceryItem.create! valid_attributes
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      grocery_item = GroceryItem.create! valid_attributes
      get :show, params: {id: grocery_item.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new GroceryItem" do
        expect {
          post :create, params: {grocery_item: valid_attributes}
        }.to change(GroceryItem, :count).by(1)
      end

      it "renders a JSON response with the new grocery_item" do

        post :create, params: {grocery_item: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(grocery_item_url(GroceryItem.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new grocery_item" do

        post :create, params: {grocery_item: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { acquired: true }
      }

      it "updates the requested grocery_item" do
        grocery_item = GroceryItem.create! valid_attributes
        put :update, params: {id: grocery_item.to_param, grocery_item: new_attributes}
        grocery_item.reload
        expect(grocery_item.acquired).to be_truthy
      end

      it "renders a JSON response with the grocery_item" do
        grocery_item = GroceryItem.create! valid_attributes

        put :update, params: {id: grocery_item.to_param, grocery_item: valid_attributes}
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the grocery_item" do
        grocery_item = GroceryItem.create! valid_attributes

        put :update, params: {id: grocery_item.to_param, grocery_item: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested grocery_item" do
      grocery_item = GroceryItem.create! valid_attributes
      expect {
        delete :destroy, params: {id: grocery_item.to_param}
      }.to change(GroceryItem, :count).by(-1)
    end
  end

end
