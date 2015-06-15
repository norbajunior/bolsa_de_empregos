module SharedUserValidations
  extend ActiveSupport::Concern

  included do
    validates :site, url: { message: 'o endereço é inválido' }, allow_blank: true
    validates :address, length: { maximum: 255 }
    validates :zipcode, length: { is: 8 }, allow_blank: true
    validates :contact, :other_contact, length: { maximum: 12 }, allow_blank: true
    validates :photo,
              :address,
              :place,
              :zipcode,
              :contact,
              :presentation, presence: true
  end
end
