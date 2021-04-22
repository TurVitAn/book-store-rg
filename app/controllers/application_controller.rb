class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protect_from_forgery

  before_action :categories, :countries

  private

  def categories
    @categories ||= Category.all
  end

  def countries
    @countries ||= ISO3166::Country.all.sort_by(&:name)
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
