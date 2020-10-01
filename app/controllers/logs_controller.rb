# frozen_string_literal: true

# Controller for Logs
class LogsController < ApplicationController
  before_action :authenticate_user!
  # GET logs/index
  def index
    @logs = current_user.logs.order(created_at: :desc)
  end

  # GET logs/new
  def new
    @activities = current_user.activities.order(habit: :desc).map(&:habit)
    if @activities.size.zero?
      flash[:alert] = 'You need an activity first'
      redirect_to new_activity_path
    end
    @log = Log.new
  end

  # POST logs/
  def create
    @log = current_user.create_log_from_hash(log_params)
    if @log&.valid?
      flash[:success] = 'Log Created'
      redirect_to logs_path
    else
      flash[:alert] = 'Error creating Log :c'
      redirect_to new_log_path
    end
  end

  # DELETE logs/
  def destroy
    @log = Log.find(params[:id])
    if @log.delete
      flash[:success] = 'Log deleted'
      redirect_to logs_path
    else
      render :index
    end
  end

  protected

  def log_params
    params.require(:log).permit(:habit, :hours, :minutes)
  end
end
