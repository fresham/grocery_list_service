require 'rails_helper'

RSpec.describe User, type: :model do
  let(:attributes) {
    { email: 'user@example.com', password: 'admin', password_confirmation: 'admin' }
  }

  it 'is valid with valid attributes' do
    expect(User.new(attributes)).to be_valid
  end

  it 'is invalid without an email' do
    attributes.delete(:email)
    expect(User.new(attributes)).not_to be_valid
  end

  it 'is invalid if email is not unique' do
    User.create!(attributes)
    expect(User.new(attributes)).not_to be_valid
  end
end
