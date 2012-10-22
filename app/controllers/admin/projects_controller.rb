class Admin::ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project Created Successfully"
      redirect_to admin_projects_path
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.attributes = params[:project]
    if @project.save
      flash[:notice] = "Project Updated Successfully"
      redirect_to admin_projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = "Project Deleted Successfully"
      redirect_to admin_projects_path
    end
  end

end
