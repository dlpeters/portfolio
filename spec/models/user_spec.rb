require 'spec_helper'

describe User do

  describe 'validations' do

    it { should validate_presence_of :email }
    it { should validate_presence_of :password}
    it { should validate_confirmation_of :password }
    it { should validate_uniqueness_of :email }
  end

  describe "password saving" do

    let!(:user) { User.create(email: "donald@duck.com",
                              password: "test1234",
                              password_confirmation: "test1234") }


    it "should not have a blank password hash" do
      user.password_hash.blank?.should == false
    end

    it "should not have a blank password salt" do
      user.password_salt.blank?.should == false
    end

  end

  describe 'authentication' do

    let!(:user) { create(:user) }
    let(:authenticated_user) { User.authenticate(user.email, "test1234")}

    it "should have an authenticated user that == user" do
      user.should == authenticated_user
    end
  end
end
