require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
  
  before :each do
    @category = Category.create! name: 'Apparel'

    @user = User.create! first_name: "first", last_name: "last", email: "testing@email.com", password: "password", password_confirmation: "password" 

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
    visit root_path
    expect(page).to have_css 'article.product', count: 10
  end

  scenario "They click the login button" do
    visit root_path
    first(".text-primary").click
    sleep(1)
    save_screenshot 'testing-click-login.png'
    expect(page).to have_content 'Login'
  end

  scenario "They login" do
    visit login_path
    find('#email').set('testing@email.com')
    find('#password').set('password')
    find(".btn.btn-primary").click
    save_screenshot 'testing-login.png'
    expect(page).to have_content 'My Cart (0)'
  end

  scenario "They login and add item to cart" do
    visit login_path
    find('#email').set('testing@email.com')
    find('#password').set('password')
    find(".btn.btn-primary").click
    save_screenshot 'testing-login.png'
    expect(page).to have_content 'My Cart (0)'
    first('.button_to').click
    puts page.html
    save_screenshot 'testing-add-to-cart.png'
    expect(page).to have_content 'My Cart (1)'
  end
end
