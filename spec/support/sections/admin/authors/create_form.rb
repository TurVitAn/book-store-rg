module Sections
  module Admin
    module Authors
      class CreateForm < SitePrism::Section
        element :first_name_input, '#author_first_name'
        element :last_name_input, '#author_last_name'
        element :create_button, '#author_submit_action > input'
        element :cancel_button, '.cancel'

        def submit(params)
          first_name_input.set(params[:first_name])
          last_name_input.set(params[:last_name])
          create_button.click
        end
      end
    end
  end
end
