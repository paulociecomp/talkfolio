def integration_sign_in!
  user = FactoryGirl.create(:base_user)

  visit "/"
  click_link "Sign in"

  fill_in "user_email", :with => user.email
  fill_in "user_password", :with => "123456"

  click_button "Sign in"
end