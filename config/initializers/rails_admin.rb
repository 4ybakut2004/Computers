RailsAdmin.config do |config|
  config.main_app_name = ["Computers"]

  config.included_models = ["AppSetting", "Service", "Price", "Email"]

  config.model "AppSetting" do
    object_label_method do
      :name
    end

    weight 1

    list do
      include_fields :company_name, :phone, :address

      field :company_name do
        label "Название компании"
      end

      field :phone do
        label "Номер телефона компании"
      end

      field :address do
        label "Адрес"
      end
    end

    edit do
      include_fields :company_name, :phone, :address, :about, :requests_email

      field :company_name do
        label "Название компании"
      end

      field :phone do
        label "Номер телефона компании"
      end

      field :address do
        label "Адрес"
      end

      field :about do
        label "О нас"
      end

      field :requests_email do
        label "Почта для получения заявок"
      end
    end

    show do
      include_fields :company_name, :phone, :address, :about, :requests_email

      field :company_name do
        label "Название компании"
      end

      field :phone do
        label "Номер телефона компании"
      end

      field :address do
        label "Адрес"
      end

      field :about do
        label "О нас"
      end

      field :requests_email do
        label "Почта для получения заявок"
      end
    end

  end

  config.model "Service" do
    object_label_method do
      :name
    end

    weight 2

    list do
      sort_by :order
      sort_reverse false

      include_fields :name, :price, :crossed_price

      field :name do
        label "Название"
      end

      field :price do
        label "Цена"
      end

      field :crossed_price do
        label "Зачеркнутая цена"
      end
    end

    edit do
      include_fields :name, :key, :show_in_header, :price, :crossed_price, :order, :big_image, :title_text

      field :name do
        label "Название"
        read_only true
      end

      field :key do
        label "Постоянная ссылка"
        read_only true
      end

      field :show_in_header do
        label "Показывать в шапке"
      end

      field :price do
        label "Цена"
      end

      field :order do
        label "Порядковый номер"
      end

      field :crossed_price do
        label "Зачеркнутая цена"
      end

      field :big_image do
        label "Большая картинка"
      end

      field :title_text, :ck_editor do
        label "Текст под заголовком"
      end
    end

    show do
      include_fields :name, :price, :crossed_price, :title_text

      field :name do
        label "Название"
      end

      field :price do
        label "Цена"
      end

      field :crossed_price do
        label "Зачеркнутая цена"
      end

      field :title_text do
        label "Текст под заголовком"
      end
    end
  end

  config.model "Price" do
    object_label_method do
      :name
    end

    weight 3

    list do
      include_fields :name, :price

      field :name do
        label "Название"
      end

      field :price do
        label "Цена"
      end
    end

    edit do
      include_fields :name, :price

      field :name do
        label "Название"
      end

      field :price do
        label "Цена"
      end
    end

    show do
      include_fields :name, :price

      field :name do
        label "Название"
      end

      field :price do
        label "Цена"
      end
    end
  end

  config.model "Email" do
    object_label_method do
      :email
    end

    weight 4

    list do
      include_fields :email

      field :email do
        label "Адрес электронной почты"
      end
    end

    edit do
      include_fields :email

      field :email do
        label "Адрес электронной почты"
      end
    end

    show do
      include_fields :email

      field :email do
        label "Адрес электронной почты"
      end
    end

  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['Service', 'AppSetting']
    end
    bulk_delete do
      except ['Service', 'AppSetting']
    end
    show
    edit
    delete do
      except ['Service', 'AppSetting']
    end
  end
end
