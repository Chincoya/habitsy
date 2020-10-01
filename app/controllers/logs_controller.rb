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
    @log = Log.new
  end

  # POST logs/
  def create
    @log = current_user.logs.create to_usable_params(log_params)
    if @log.valid?
      flash[:success] = 'Log Created'
      redirect_to logs_path
    else
      flash.now[:alert] = 'Error creating Log :c'
      render 'new'
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

  def to_usable_params(params)
    { habit: params[:habit], time: (params[:hours].to_i * 60) + params[:minutes].to_i }
  end
end
