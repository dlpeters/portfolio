require 'spec_helper'

describe Admin::PostsController do

  describe 'on GET to index' do

    let!(:post) { create(:post) }

    before { get :index }

    it { should assign_to(:posts).with([post]) }
    it { should render_template(:index) }

  end

  describe 'on GET to edit' do

    let(:post) { create(:post) }

    before { get :edit, id: post.id }

    it { should assign_to(:post).with(post) }
    it { should render_template(:edit) }

  end

  describe 'on PUT to update' do

    let(:post) { create(:post) }

    context 'with success' do

      before { put :update, id: post.id, post: {title: "Test Post 2"} }

      it { should assign_to(:post).with(post) }
      it { should redirect_to admin_posts_path }
      it { should set_the_flash[:notice].to("Post Saved Successfully") }

      it "should update the title" do
        assigns(:post).title.should eq("Test Post 2")
      end

    end

    context 'with failure' do

      before { put :update, id: post.id, post: {title: ""} }

      it { should assign_to(:post).with(post) }
      it { should render_template(:edit) }

      it "should have error messages on post.title" do
        assigns(:post).errors.messages[:title].should eq(["can't be blank"])
      end

    end
  end

  describe 'on GET to new' do

    before { get :new }

    it { should assign_to(:post) }
    it { should render_template(:new) }

  end

  describe 'on POST to create' do

    context 'without errors' do
      before { post :create, post: {title: "Test Post", content: "Test Post" } }

      it { should assign_to(:post) }
      it { should redirect_to admin_posts_path }
      it { should set_the_flash[:notice].to("Post Created Successfully") }

      it "should assign the post title" do
        assigns(:post).title.should eq("Test Post") 
      end

      it "should assign the post content" do
        assigns(:post).content.should eq("Test Post")
      end

    end

    context 'with errors' do

      before { post :create, post: {title: "", content: "" } }

      it { should assign_to(:post) }
      it { should render_template :new }

      it "should have error messages on post title" do
        assigns[:post].errors.messages[:title].should eq(["can't be blank"])
      end

      it "should have error messages on post content" do
        assigns[:post].errors.messages[:title].should eq(["can't be blank"])
      end

    end
  end

  describe 'on POST to destroy' do

    let!(:post) { create(:post) }
    let!(:posts) { Post.all }

    before { delete :destroy, id: post.id }

    it { should assign_to(:post) }
    it { should redirect_to admin_posts_path }
    it { should set_the_flash[:notice].to("Post Deleted Successfully") }

    it "should delete the post" do
      Post.all.size.should == posts.size - 1
    end

  end

end
