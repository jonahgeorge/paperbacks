require "rails_helper"

describe "sign in", :type => :feature do
  scenario "user enters a blank email" do
    user = FactoryGirl.create(:user)

    visit '/login'

    fill_in('email', :with => '')
    fill_in('password', :with => user.password)
    click_button('login')

    expect(current_path).to eq('/login')
    expect(page).to have_content 'Invalid email or password'
  end

  scenario "user enters a blank password" do
    user = FactoryGirl.create(:user)

    visit '/login'

    fill_in('email', :with => user.email)
    fill_in('password', :with => '')
    click_button('login')

    expect(current_path).to eq '/login'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario "first valid user login" do
	user = FactoryGirl.create(:user)

    visit '/login'

    fill_in('email', :with => user.email)
    fill_in('password', :with => user.password)
    click_button('login')

    expect(current_path).to eq '/confirm'
  end

  scenario "valid user login" do
	user = FactoryGirl.create(:user, confirmed: true)

    visit '/login'

    fill_in('email', :with => user.email)
    fill_in('password', :with => user.password)
    click_button('login')

    expect(current_path).to eq '/'
    expect(page).to have_content 'Logged in!'
  end
end
