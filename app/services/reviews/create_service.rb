module Reviews
  class CreateService
    attr_reader :errors

    def initialize(params)
      @params = params
      @review_form = ReviewForm.new(params)
    end

    def call
      review_form.valid? ? review_create(params) : collect_errors
    end

    private

    attr_reader :params, :review_form

    def review_create(params)
      Review.create(params)
    end

    def collect_errors
      @errors = review_form.errors
      errors.blank?
    end
  end
end
