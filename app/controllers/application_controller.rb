class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :set_categories

  private

  def set_categories
    @categories = Category.all
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
