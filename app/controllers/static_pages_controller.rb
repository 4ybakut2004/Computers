class StaticPagesController < ApplicationController

  def index
    render "layouts/application"
  end

  def home
    @services_array = Service.all.order("services.order ASC")
    @services = @services_array.inject({}) { |hash, service| hash[service.key] = service; hash }
    @settings = AppSetting.first

    render 'static_pages/home', layout: false
  end
end