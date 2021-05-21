class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protect_from_forgery

  before_action :header_presenter, :current_order

  private

  def header_presenter
    @header_presenter = HeaderPresenter.new(order: current_order&.decorate)
  end

  def current_order
    Order.find_by(id: cookies[:order_id])
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
