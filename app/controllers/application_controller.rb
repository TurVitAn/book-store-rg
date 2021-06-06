class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :categories

  private

  def categories
    @categories ||= Category.all
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
