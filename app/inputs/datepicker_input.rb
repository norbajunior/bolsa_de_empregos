class DatepickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)

    options = {
      value: value.nil?? nil : I18n.l(value),
      data: { provide: 'datepicker', 'date-format' => 'dd/mm/yyyy' },
      placeholder: '__/__/____'
    }

    super.merge options
  end
end
