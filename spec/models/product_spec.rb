require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validates all fields are present" do
        @category = Category.new name: 'Cat' 
        @category.save!
        @product = Product.new name: 'Name', category: @category, price: 20, quantity: 2 
        @product.save!

        expect(@product).to be_present

    end
  
    it "the name field returns nil" do
      @category = Category.new name: 'Cat' 
      @category.save
      @product = Product.new name: nil, category: @category, price: 20, quantity: 2 
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "returns 'Category can't be blank' error message when the category field is nil" do
      @category = Category.new name: 'Cat' 
      @category.save
      @product = Product.new name: 'Name', category: nil, price: 20, quantity: 2 
      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it "returns 'Price can't be blank' error message when the category field is nil" do
      @category = Category.new name: 'Cat' 
      @category.save
      @product = Product.new name: 'Name', category: @category, price: "hello", quantity: 2 
      @product.save

      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it "returns 'Quantity can't be blank' error message when the category field is nil" do
      @category = Category.new name: 'Cat' 
      @category.save
      @product = Product.new name: 'Name', category: @category, price: 20, quantity: nil 
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
  end
end
