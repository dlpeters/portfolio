require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do

    before { get :new }
    it "should assign a new user" do
      assigns(:user).new_record?.should == true
    end
  end

  describe "POST to create" do

    describe 'with valid user attributes' do
      before { post :create, user: {email: "donald@duck.com",
                                    password: "test1234",
                                    password_confirmation: "test1234"}}
      it "should create a user" do
        assigns(:user).email.should == "donald@duck.com"
      end
    end

    describe 'with invalid email' do
      before { post :create, user: { email: "",
                                     password: "test1234",
                                     password_confirmation: "test1234"}}

      it { should render_template :new}

      it "should not create a user" do
        assigns(:user).new_record?.should == true
      end

    end

  end

end
