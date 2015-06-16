require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  should 'get new session' do
    get :new

    assert_response :success

    assert_template 'sessions/new'
  end

  context 'when user is inactive' do
    should 'not log in' do
      post :create, session: { email: users(:inactive).email, password: '123456' }

      assert_nil session[:user_id]

      assert_template :new

      assert_equal 'Usuário inativo', flash[:warning]
    end
  end

  context 'normal users (Entity or Candidate)' do
    should 'log in and redirected to its dashboard page' do
      post :create, session: { email: users(:wiremaze).email, password: '123456' }

      assert_equal session[:user_id], users(:wiremaze).id

      assert_redirected_to dashboard_entity_path(users(:wiremaze))
    end

    should 'not log in with wrong password' do
      post :create, session: { email: users(:wiremaze).email, password: 'abcdef' }

      assert_nil session[:user_id]

      assert_template :new

      assert_equal 'Email/password inválidos', flash[:alert]
    end

    should 'log out and redirected to root path' do
      session[:user_id] = users(:wiremaze).id

      post :destroy, id: users(:wiremaze).id

      assert_nil session[:user_id]

      assert_redirected_to root_path
    end
  end

  context 'backoffice user' do
    should 'log in and be redirected to root path' do
      post :create, session: { email: users(:backoffice).email, password: '123456' }

      assert_equal session[:user_id], users(:backoffice).id

      assert_redirected_to root_path
    end
  end
end
