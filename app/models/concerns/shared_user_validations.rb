module SharedUserValidations
  extend ActiveSupport::Concern

  included do
    validates :site, url: { message: 'o endereço é inválido' }, allow_blank: true
    validates :photo, file_size: { less_than: 1.megabyte }
    validates :address, length: { maximum: 255 }
    validates :zipcode, length: { is: 8 }, allow_blank: true
    validates :contact, :other_contact, length: { in: 8..20 }, allow_blank: true
    validates :photo,
              :address,
              :place,
              :zipcode,
              :contact,
              :presentation, presence: true
  end
end
