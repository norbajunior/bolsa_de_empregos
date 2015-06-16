class FeaturedController < ApplicationController
  def index
    @candidates = Candidate.most_have_interested_ones.take(5)
    @entities = Entity.featured.take(5)
    @offers = Offer.featured.take(5)
  end
end
