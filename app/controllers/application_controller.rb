class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protect_from_forgery

  before_action :categories, :set_locale

  private

  def categories
    @categories ||= Category.all
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge(options)
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
