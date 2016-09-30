class StaticPagesController < ApplicationController

  def index
    render "layouts/application"
  end

  def home
    @services_array = Service.all.to_a
    @services = @services_array.inject({}) { |hash, service| hash[service.key] = service; hash }
    @prices = Price.all.order("id ASC").to_a
    @settings = AppSetting.first

    render 'static_pages/home', layout: false
  end

  def success_dialog
    render 'static_pages/_success_dialog', layout: false
  end

  def error_dialog
    render 'static_pages/_error_dialog', layout: false
  end

end