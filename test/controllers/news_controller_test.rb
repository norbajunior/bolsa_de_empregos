require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  should 'get index' do
    get :index

    assert_not_nil assigns(:news)

    assert_response :success
  end

  should 'get show' do
    get :show, id: news(:volt).id

    assert_not_nil assigns(:news)

    assert_response :success
  end
end
