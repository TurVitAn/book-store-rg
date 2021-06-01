class SettingsController < ApplicationController
  def index
    @settings_presenter = SettingsPresenter.new(user: current_user)
  end
end
