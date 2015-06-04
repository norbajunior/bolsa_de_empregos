require 'test_helper'

class EntitiesControllerTest < ActionController::TestCase
  def setup
    @entity = users(:wiremaze)
  end

  test "should get index" do
    get :index

    assert_response :success
  end

  test "should get new" do
    get :new

    assert_response :success
  end

  test "should get edit" do
    session[:user_id] = @entity.id

    get :edit, id: @entity

    assert_response :success
  end

  test "should update entity" do
    session[:user_id] = @entity.id

    patch :update, id: @entity, entity: { other_contact: '(+351) 228 328 824' }

    assert_response :redirect

    assert_redirected_to entity_path(assigns(:entity))
  end

  test "should create entity" do
    assert_difference('Entity.count') do
      post :create, entity: {
        email: 'geral@wiremaze.com',
        password: '123456',
        password_confirmation: '123456',
        name: 'Wiremaze',
        address: 'Edifício Capitólio - Torre Venetto Av. França 256, Piso 6, Sala 6.8',
        zipcode: '4050-476',
        place: 'Porto',
        site: 'http://wiremaze.com',
        nif: '1234567',
        professional_activity: 'Software Development',
        presentation: 'Criamos soluções que ajudam os nossos clientes a
                       ultrapassar os seus desafios de forma simples.',
        contact: '(+351) 228 328 813',
        other_contact: '(+351) 228 328 823'
      }
    end

    assert_redirected_to entity_path(assigns(:entity))

    # assert_equal 'Entidade registada com sucesso.', flash[:notice]
  end
end
