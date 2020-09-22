require 'rails_helper'

RSpec.feature "Visitor can navigate from the home page to the product details page by clicking on a product", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG 
    save_screenshot 'home_page.png'
    
    #VERIFY
    expect(page).to have_css 'article.product', count: 10
  end

  scenario "They click on first product" do 
  visit root_path
  first(".product img").click
  sleep(1)
  save_screenshot 'product_details.png'
  expect(page).to have_css 'section.products-show'
  end
end
