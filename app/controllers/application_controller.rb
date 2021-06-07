class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, ActiveRecord::ActiveRecordError, with: :record_not_found
  protect_from_forgery

  before_action :header_presenter, :merge_order_items

  private

  def header_presenter
    @header_presenter = HeaderPresenter.new(order: current_order&.decorate)
  end

  def current_order
    return Order.find_by(id: cookies[:order_id]) unless user_signed_in?

    Order.where('status < ?', Order.statuses[:complete]).find_by(user: current_user)
  end

  def merge_order_items
    return unless user_signed_in?

    Orders::MergeService.new(guest_order_id: cookies[:order_id], user: current_user).call
    cookies.delete(:order_id)
  end

  def record_not_found
    render('layouts/errors/not_found', status: :not_found)
  end
end
