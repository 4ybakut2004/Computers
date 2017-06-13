RailsAdmin.config do |config|
  config.main_app_name = ["Computers"]

  config.included_models = ["AppSetting", "Service", "Price", "Email", "PhoneNumber", "Request"]

  config.model "Request" do
    object_label_method do
      :name
    end

    weight 1

    list do
      include_fields :phone, :name, :sms_sent, :created_at

      field :phone do
        label "Номер телефона"
      end

      field :name do
        label "Имя"
      end

      field :sms_sent do
        label "SMS отправлено"
      end

      field :created_at do
        label "Дата создания"
      end
    end

    edit do
      include_fields :phone, :name, :sms_sent, :sms_status, :created_at

      field :phone do
        label "Номер телефона"
      end

      field :name do
        label "Имя"
      end

      field :sms_sent do
        read_only true
        label "SMS отправлено"
      end

      field :sms_status do
        read_only true
        label "Статус отправки SMS"
      end

      field :created_at do
        read_only true
        label "Дата создания"
      end
    end

    show do
      include_fields :phone, :name, :sms_sent, :sms_status, :created_at

      field :phone do
        label "Номер телефона"
      end

      field :name do
        label "Имя"
      end

      field :sms_sent do
        label "SMS отправлено"
      end

      field :sms_status do
        label "Статус отправки SMS"
      end

      field :created_at do
        label "Дата создания"
      end
    end
  end

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
      include_fields :company_name, :phone, :address, :about

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
    end

    show do
      include_fields :company_name, :phone, :address, :about

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

      include_fields :name, :price, :crossed_price, :order

      field :name do
        label "Название"
      end

      field :price do
        label "Цена"
      end

      field :crossed_price do
        label "Зачеркнутая цена"
      end

      field :order do
        label "Порядковый номер"
      end
    end

    edit do
      include_fields :name, :key, :show_in_header, :price, :crossed_price, :order, :big_image, :title_text

      field :name do
        label "Название"
      end

      field :key do
        label "Постоянная ссылка"
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

  config.model "PhoneNumber" do
    object_label_method do
      :phone
    end

    weight 5

    list do
      include_fields :phone

      field :phone do
        label "Номер телефона"
      end
    end

    edit do
      include_fields :phone

      field :phone do
        label "Номер телефона"
      end
    end

    show do
      include_fields :phone

      field :phone do
        label "Номер телефона"
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['AppSetting']
    end
    bulk_delete do
      except ['Service', 'AppSetting']
    end
    show
    edit
    delete do
      except ['AppSetting']
    end
  end
end
