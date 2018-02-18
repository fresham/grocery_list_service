require 'rails_helper'

RSpec.describe GroceryItem, type: :model do
  let(:attributes) { { name: 'Milk', acquired: false } }

  it 'is valid with valid attributes' do
    expect(GroceryItem.new(attributes)).to be_valid
  end

  it 'is invalid without a name' do
    attributes.delete(:name)
    expect(GroceryItem.new(attributes)).not_to be_valid
  end

  it 'is invalid if name is not unique' do
    GroceryItem.create!(attributes)
    expect(GroceryItem.new(attributes)).not_to be_valid
  end

  it 'is not acquired by default' do
    expect(GroceryItem.new.acquired).to be_falsey
  end
end
