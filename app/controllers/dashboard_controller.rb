class DashboardController < ApplicationController
  def index
    @offers = Offer.limit(3)
    @entities = Entity.limit(3)
    @news = News.limit(3)
    @candidates = Candidate.limit(3)
  end
end
