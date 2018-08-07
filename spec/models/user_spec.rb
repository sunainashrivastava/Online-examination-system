require "rails_helper"
require 'byebug'
RSpec.describe User, :type => :model do
  
  # before(:all) do
    # @user1 = create(:user)
  # end
  
  it "is valid with valid attributes" do
    debugger
    @user1 = create(:user)
   expect(@user1).to be_valid
  end
  
  it "has a unique username" do

    user2 = build(:user, username: "joe123")
    expect(user2).to be_valid
  end
  
  it "has a unique email" do
    user2 = build(:user, email: "bob1@gmail.com")
    expect(user2).to be_valid
  end
  
  it "is not valid without a password" do 
    user2 = build(:user, password: "12345678a")
    expect(user2).to be_valid
  end
  
  it "is not valid without a username" do 
    debugger
    user2 = build(:user, username: nil)
    expect(user2).to_not be_valid
  end


  it "is not valid without an email" do
    user2 = build(:user, email: "123@123.com")
    expect(user2).to be_valid
  end
end