require 'test_helper'

class EntitiesHelperTest < ActionView::TestCase
  context '#number_of_active_offers' do
    should "return a phrase with the amount of entity's offers" do
      assert_equal '1 oferta activa', number_of_active_offers(users(:wiremaze))
    end
  end
end
