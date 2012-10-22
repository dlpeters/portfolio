require 'spec_helper'

describe SessionsController do

  describe "GET to new" do

    before { get :new }

    it { should render_template :new }

  end

  describe "POST to create" do

    let!(:user) { create(:user) }

    before { post :create, email: "donald@duck.com",
                           password: "test1234" }


    it { should redirect_to('/') }
    it { should set_session(:user_id).to(user.id) }

  end
end
