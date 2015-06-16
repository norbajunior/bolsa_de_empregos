require 'test_helper'

class EntitiesControllerTest < ActionController::TestCase
  should "get index" do
    get :index

    assert_response :success
  end

  should "get new" do
    get :new

    assert_response :success
  end

  should "get edit" do
    session[:user_id] = users(:wiremaze).id

    get :edit, id: users(:wiremaze)

    assert_response :success
  end

  should "get show" do
    get :show, id: users(:wiremaze).id

    assert_not_nil assigns(:entity)

    assert_response :success
  end

  should "create entity and redirect to its dashboard page" do
    assert_difference('Entity.count') do
      post :create, entity: {
        email: 'geral@wiremaze.pt',
        password: '123456',
        password_confirmation: '123456',
        name: 'Wiremaze',
        address: 'Edifício Capitólio - Torre Venetto Av. França 256, Piso 6, Sala 6.8',
        zipcode: '4050-476',
        place: Concelhos::PORTO,
        site: 'http://wiremaze.com',
        nif: '123456780',
        professional_activity: ProfessionalActivity::SOFTWARE_DEVELOPMENT,
        photo: fixture_file_upload('/files/022.gif', 'image/gif'),
        presentation: 'Criamos soluções que ajudam os nossos clientes a
                       ultrapassar os seus desafios de forma simples.',
        contact: '(+351) 228 328 813',
        other_contact: '(+351) 228 328 823'
      }
    end

    assert_redirected_to dashboard_entity_path(assigns(:entity))

    assert_equal 'Entidade registada com sucesso', flash[:notice]
  end

  should "update entity and redirect to its dashboard page" do
    session[:user_id] = users(:wiremaze).id

    patch :update, id: users(:wiremaze).id, entity: {
      other_contact: '(+351) 228 328 824',
      photo: fixture_file_upload('/files/022.gif', 'image/gif')
    }

    assert_response :redirect

    assert_redirected_to dashboard_entity_path(assigns(:entity))
  end
end
