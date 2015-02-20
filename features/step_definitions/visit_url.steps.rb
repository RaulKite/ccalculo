When(/^I visit the root page$/) do
  visit root_path
end

When(/^I visit dashboard page$/) do
  begin
    visit dashboard_path
  rescue  ActionController::RoutingError  => @route_exception
  end
end

Then(/^I should be redirected to sso login page$/) do
  expect(@route_exception.to_s).to include("login")
end

Then(/^I can see dashboard page$/) do
  page.should have_content("Dashboard")
end


