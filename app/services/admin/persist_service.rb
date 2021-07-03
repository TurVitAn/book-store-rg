module Admin
  class PersistService
    attr_reader :errors

    ENTITIES = {
      category: Category,
      author: Author,
      book: Book,
      delivery: Delivery
    }.freeze

    def initialize(entity:, params:)
      @entity_class = ENTITIES[entity]
      @id = params[:id]
      @params = params[ENTITIES.key(@entity_class)]
      @form = "#{@entity_class}Form".constantize.new(@params)
    end

    def call
      form.valid? ? persist_entity : collect_errors
    end

    private

    attr_reader :entity_class, :id, :params, :form

    def persist_entity
      entity_class.find_or_initialize_by(id: id).update(params)
    end

    def collect_errors
      @errors = form.errors || {}
      errors.blank?
    end
  end
end
