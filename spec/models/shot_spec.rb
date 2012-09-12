require 'spec_helper'

describe Shot do
  let!(:user) do
    User.create! :email => "user@example.com", :name => "Jony Cash", :password => "password"
  end

  subject do
    Shot.new :user => user, :title => "My amazing shot",
      :shot_image => File.open(Rails.root.join("spec/support/data/test.jpg"))
  end

  it "should be valid" do
    subject.should be_valid
  end

  it "should validate the presence of the title" do
    subject.title = ""
    subject.should_not be_valid
  end

  it "should validate the presence of the user" do
    subject.user = nil
    subject.should_not be_valid
  end

  it "should validate the presence of the shot_image" do
    subject.shot_image.remove!
    subject.should_not be_valid
  end

  it "should respond to 'to_s' with their title" do
    subject.title = "Some good title"
    subject.to_s.should == "Some good title"
  end
end
