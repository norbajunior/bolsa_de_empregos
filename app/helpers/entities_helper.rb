module EntitiesHelper
  def number_of_active_offers(number)
    pluralize(number, 'oferta activa', 'ofertas activas')
  end
end
