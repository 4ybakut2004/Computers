class StaticPagesController < ApplicationController

  def index
    render "layouts/application"
  end

  def home
    @services_array = Service.all.to_a
    @services = @services_array.inject({}) { |hash, service| hash[service.key] = service; hash }
    @prices = Price.all.to_a
    @settings = AppSetting.first

    render 'static_pages/home', layout: false
  end
end