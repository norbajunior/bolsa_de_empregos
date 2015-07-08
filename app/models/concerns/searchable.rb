module Searchable
  def by(filters, searched = all)
    return searched unless filters

    filters.each do |scope, value|
      searched = searched.public_send(scope, value) if value.present?
    end

    searched
  end
end
