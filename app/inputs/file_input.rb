class FileInput < SimpleForm::Inputs::FileInput
  def input_html_options
    super.merge class: 'filestyle', data: { 'ButtonText' => 'Ficheiro', input: false }
  end
end
