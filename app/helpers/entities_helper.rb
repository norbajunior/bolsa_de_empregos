module EntitiesHelper
  def number_of_active_offers(entity)
    pluralize(entity.offers.size, 'oferta activa', 'ofertas activas')
  end
end
