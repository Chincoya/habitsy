# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    redirect_to logs_path if current_user
  end
end
