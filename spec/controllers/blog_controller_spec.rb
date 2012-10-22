require 'spec_helper'

describe BlogController do

  # GET /blog -> BlogController#index
  describe "GET to index" do

    let!(:post1) { create(:post) }
    let!(:post2) { create(:post) }

    before { get :index }

    it "should assign entry to entries" do
      assigns(:posts).should == ([post2, post1])
    end

  end

  # GET /blog/:id -> BlogController#show
  describe "GET to show" do

    let!(:post) { create(:post) }

    before { get :show, :id => post.id }

    it "should assign entry to entry" do
      assigns(:post).should == post
    end

  end

end
