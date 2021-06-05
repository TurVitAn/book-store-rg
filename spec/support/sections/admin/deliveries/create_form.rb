module Sections
  module Admin
    module Deliveries
      class CreateForm < SitePrism::Section
        element :kind_input, '#delivery_kind'
        element :price_input, '#delivery_price'
        element :from_days_input, '#delivery_from_days'
        element :to_days_input, '#delivery_to_days'
        element :create_button, '#delivery_submit_action > input'
        element :cancel_button, '.cancel'

        def submit(params)
          kind_input.set(params[:kind])
          price_input.set(params[:price])
          from_days_input.set(params[:from_days])
          to_days_input.set(params[:to_days])
          create_button.click
        end
      end
    end
  end
end
