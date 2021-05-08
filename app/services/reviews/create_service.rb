module Reviews
  class CreateService
    attr_reader :errors

    def initialize(params)
      @params = params
      @review_form = ReviewForm.new(params)
    end

    def call
      review_form.valid? ? Review.create(params) : @errors = review_form.errors

      errors.blank?
    end

    private

    attr_reader :params, :review_form
  end
end
