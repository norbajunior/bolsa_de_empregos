require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  def setup
    @candidate = users(:norberto)
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
    session[:user_id] = @candidate.id

    get :edit, id: @candidate

    assert_response :success
  end

  test "should get show" do
    get :show, id: @candidate

    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, candidate: {
        email: 'norbejunior@gmail.com',
        password: '123456',
        password_confirmation: '123456',
        name: 'Norberto Oliveira Junior',
        date_of_birth: Date.new(1987, 5, 14),
        address: 'Largo do Priorado, 80',
        zipcode: '4050-476',
        place: 'Porto',
        site: 'http://linkedin.com/in/norbajunior',
        presentation: 'Ruby on Rails Engineer',
        contact: '(+351) 917 131 878',
        experience: '4 years working with web development'
      }
    end

    assert_redirected_to candidate_path(assigns(:candidate))

    # assert_equal 'Candidato registado com sucesso.', flash[:notice]
  end


  test "should update entity" do
    session[:user_id] = @candidate.id
    
    patch :update, id: @candidate, candidate: { other_contact: '(+351) 228 328 824' }

    assert_response :redirect

    assert_redirected_to candidate_path(assigns(:candidate))
  end
end
