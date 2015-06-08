class Search
  def self.by(searched, filters)
    new(searched, filters).by
  end

  def initialize(searched, filters)
    @searched, @filters = searched, filters
  end

  def by
    return @searched unless @filters

    @filters.each do |scope, value|
      @searched = @searched.public_send(scope, value) if value.present?
    end

    @searched
  end
end
