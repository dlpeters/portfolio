require 'spec_helper'

describe Admin::ProjectsController do


  describe 'on GET to index' do

    let!(:project) { create(:project) }

    before { get :index }

    it { should assign_to(:projects).with([project]) }
    it { should render_template(:index) }

  end

  describe 'on GET to new' do

    before { get :new }

    it { should assign_to(:project) }
    it { should render_template(:new) }

  end

  describe 'on POST to create' do

    before { post :create, project: {title: "Test Project", content: "Test Project"} }

    it { should assign_to(:project) }
    it { should redirect_to admin_projects_path }

     it "should have the correct project title" do
       assigns(:project).title.should == "Test Project" 
     end

     it "should have the correct project content" do
       assigns(:project).content.should == "Test Project"
     end

  end

  describe 'on GET to edit' do

    let(:project) { create(:project) }

    before { get :edit, id: project.id }

    it { should assign_to(:project).with(project) }
    it { should render_template(:edit) }

  end

  describe 'on PUT to update' do

    let(:project) { create(:project) }

    before { put :update, id: project.id, project: {title: "Test Project 2" } }

    it { should assign_to(:project).with(project) }
    it { should redirect_to admin_projects_path }

    it "should have the correct project title" do
      assigns(:project).title.should eq("Test Project 2")
    end

  end
end
