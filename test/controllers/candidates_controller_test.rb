require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  should "get index" do
    get :index

    assert_response :success
  end

  should "get new" do
    get :new

    assert_response :success
  end

  should "get edit" do
    session[:user_id] = users(:norberto).id

    get :edit, id: users(:norberto).id

    assert_response :success
  end

  should "get show" do
    get :show, id: users(:norberto).id

    assert_response :success
  end

  should "create candidate and redirect to its dashboard page" do
    assert_difference('Candidate.count') do
      post :create, candidate: {
        email: 'norbajunior@icloud.com',
        password: '123456',
        password_confirmation: '123456',
        name: 'Norberto Oliveira Junior',
        employment_status: EmploymentStatus::EMPLOYED,
        scholarity: Scholarity::BACHAREL,
        date_of_birth: Date.new(1987, 5, 14),
        address: 'Largo do Priorado, 80',
        photo: fixture_file_upload('/files/022.gif', 'image/gif'),
        cv: fixture_file_upload('/files/CV.doc', 'application/msword'),
        zipcode: '4050-476',
        place: Concelhos::PORTO,
        site: 'http://linkedin.com/in/norbajunior',
        identity_number: 285543873,
        presentation: 'Ruby on Rails Engineer',
        professional_area: ProfessionalArea::WEB_DEVELOPMENT,
        contact: '(+351) 917 131 878',
        experience: '4 years working with web development'
      }
    end

    assert_redirected_to dashboard_candidate_path(assigns(:candidate))

    assert_equal 'Candidato registado com sucesso', flash[:notice]
  end

  should "update candidate and redirect to its dashboard page" do
    session[:user_id] = users(:norberto).id

    patch :update, id: users(:norberto).id, candidate: {
      other_contact: '(+351) 228 328 824',
      photo: fixture_file_upload('/files/022.gif', 'image/gif'),
      cv: fixture_file_upload('/files/CV.doc', 'application/msword'),
    }

    assert_response :redirect

    assert_redirected_to dashboard_candidate_path(assigns(:candidate))

    assert_equal 'Candidato atualizado com sucesso', flash[:notice]
  end
end
