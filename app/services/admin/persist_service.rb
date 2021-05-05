module Admin
  class PersistService
    attr_reader :errors

    ENTITIES = {
      category: Category,
      author: Author
    }.freeze

    def initialize(entity:, params:)
      @entity_class = ENTITIES[entity]
      @id = params[:id]
      @params = params[ENTITIES.key(@entity_class)]
      @form = "#{@entity_class}Form".constantize.new(@params)
      @errors = {}
    end

    def call
      form.valid? ? persist_entity : @errors = form.errors

      errors.blank?
    end

    private

    attr_reader :entity_class, :id, :params, :form

    def persist_entity
      id ? entity_class.find_by(id: id).update(params) : entity_class.create(params)
    end
  end
end
