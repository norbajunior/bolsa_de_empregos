require 'test_helper'

class EntitiesHelperTest < ActionView::TestCase
  context '#number_of_active_offers' do
    should "return a phrase with the number of entity's offers" do
      assert_equal '0 ofertas activas', number_of_active_offers(0)
      assert_equal '1 oferta activa', number_of_active_offers(1)
      assert_equal '2 ofertas activas', number_of_active_offers(2)
    end
  end
end
