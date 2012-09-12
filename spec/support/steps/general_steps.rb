step "I go to the homepage" do
  visit root_path
end

step "I go to the sign up page" do
  visit new_user_registration_path
end

step "I should see a :anchor link" do |anchor|
  page.should have_link(anchor)
end

step "I fill in :field with :content" do |field, content|
  fill_in field, :with => content
end

step "I click on :button" do |button|
  click_button button
end

step "I click at :link" do |link|
  click_link link
end

step "I should see :text" do |text|
  page.should have_content(text)
end

step "show me the page" do
  save_and_open_page
end

step "I should see :text in the preheader" do |text|
  within(".navbar") do
    page.should have_content(text)
  end
end
