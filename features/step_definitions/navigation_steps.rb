# features/step_definitions/login_steps.rb

Given('There is a user with name {string} and password {string}') do |name, password|
    @user = User.find_by(name: name)
end


When('I visit the login page') do
    visit root_path # Certifique-se de ajustar a rota para a página de login correta
end

When('I put in {string} with {string}') do |field, value|
    fill_in field, with: value
end

When('I insert in {string} with {string}') do |field, value|
    fill_in field, with: value
end

When('I press {string}') do |button|
    click_button button
end

Then('I should go to homepage') do
    visit home_homepage_path
end
