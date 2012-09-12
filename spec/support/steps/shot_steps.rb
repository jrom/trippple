step "there is a shot" do
  @shot_author = User.create! :email => "user@example.com",
    :name => "Jony Cash",
    :password => "password"
  @shot = Shot.create! :user => @shot_author, :title => "My amazing shot",
    :shot_image => File.open(Rails.root.join("spec/support/data/test.jpg"))
end
