class HeaderPresenter
  DEFAULT_BOOKS_COUNT = 0

  def initialize(cart:)
    @cart = cart
  end

  def books_in_cart
    cart ? cart.items_count : DEFAULT_BOOKS_COUNT
  end

  private

  attr_reader :cart
end
