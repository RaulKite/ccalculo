When(/^I am not authenticated$/) do
  pepito = FactoryGirl.create(:user)
  login_as(pepito, :scope => "user")
  logout
end

When(/^I am authenticated$/) do
  pepito = FactoryGirl.create(:user)
  login_as(pepito, :scope => "user")
end


