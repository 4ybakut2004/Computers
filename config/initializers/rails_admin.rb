RailsAdmin.config do |config|
  config.main_app_name = ["Computers"]

  config.included_models = []

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['Section']
    end
    bulk_delete do
      except ['Section']
    end
    show
    edit
    delete do
      except ['Section']
    end
  end
end
