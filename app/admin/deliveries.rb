ActiveAdmin.register Delivery do
  permit_params :kind, :price, :from_days, :to_days

  actions :all
  config.filters = false

  controller do
    def create
      @delivery = Delivery.new(permitted_params[:delivery])
      persist_delivery(:new)
    end

    def update
      @delivery = Delivery.find_by(id: permitted_params[:id])
      persist_delivery(:edit)
    end

    private

    def persist_delivery(view)
      service = Admin::PersistService.new(entity: :delivery, params: permitted_params)
      return redirect_to(admin_deliveries_path, notice: I18n.t('notice.delivery.saved')) if service.call

      @errors = service.errors
      render(view)
    end
  end

  index do
    selectable_column
    id_column
    column :kind
    column :price
    column :from_days
    column :to_days
    actions
  end

  form partial: 'form'
end
