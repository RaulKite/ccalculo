When(/^I visit the root page$/) do
  visit root_path
end

Then(/^I should be in the landing home page$/) do
  expect(page.title).to eq("Centro de Cálculo de la Facultad de Informática de la UM")
end
