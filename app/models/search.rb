class Search
  def self.by(searched, filters)
    new(searched, filters).by
  end

  def initialize(searched, filters)
    @searched, @filters = searched, filters
  end

  def by
    return @searched unless @filters

    @searched = @searched.by_name(@filters[:by_name])

    enumeration_filters.each_value do |value|
      @searched = @searched.public_send(value) if value.present?
    end

    @searched
  end

  private

  def enumeration_filters
    @filters.except(:by_name)
  end
end
