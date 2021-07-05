class OrdersPresenter
  DELIVERED_STATUS_CLASS = 'text-success'.freeze
  IN_DELIVERY_STATUS_CLASS = 'text-info'.freeze
  CANCELED_STATUS_CLASS = 'text-danger'.freeze
  OTHER_STATUSES_CLASS = 'in-grey-900'.freeze

  def add_class_for_status(order)
    return DELIVERED_STATUS_CLASS if order.status == :delivered.to_s
    return IN_DELIVERY_STATUS_CLASS if order.status == :in_delivery.to_s
    return CANCELED_STATUS_CLASS if order.status == :canceled.to_s

    OTHER_STATUSES_CLASS
  end
end
