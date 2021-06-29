module Reviews
  class CreateService
    attr_reader :errors

    def initialize(params)
      @review_form = ReviewForm.new(params)
    end

    def call
      if  review_form.invalid?
        @errors = review_form.errors
        return false
      end

      review = Review.new(review_form.attributes)
      unless review.save
        @errors = review.errors
        return false
      end

      true
    end

    private

    attr_reader :review_form
  end
end
