# frozen_string_literal: true

# Controller for the resource activities
class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def show
    @activity = current_user.activities.find(params[:id])
    puts "\n\n\n-----------"
    puts @activity.habit.upcase
    puts "\n\n\n-----------"
    unless @activity
      flash[:error] = 'That record is not yours'
      redirect_to activities_path
    end
    @logs = @activity.logs
  end

  def index
    @activities = current_user.activities.order(created_at: :desc)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.create(activity_params)
    if @activity.valid?
      flash[:success] = 'Activity Registered'
      redirect_to logs_path
    else
      flash.now[:alert] = 'Error registering activity :c'
      render :new
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    if @activity.user_id == current_user.id && @activity.delete
      flash[:success] = 'Activity Deleted'
      redirect_to logs_path
    else
      render :index
    end
  end

  protected

  def activity_params
    params.require(:activity).permit(:habit)
  end
end
