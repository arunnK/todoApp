RSpec.describe UsersController, type: :controller  do
  before do
    @valid_params={first_name: 'Arun', last_name: 'Kumar', email: 'akc@gmail.com', phone: '9876456783',
               password: '3546twrtet!!32', password_confirmation: '3546twrtet!!32'}
    @invalid_params={first_name: 'Arun', last_name: 'Kumar', email: nil, phone: '9876456783',
               password: '3546twrtet!!32', password_confirmation: '3546twrtet!!32'}
    user1={first_name: 'Arun',last_name: 'Kumar', email: 'abc@g.com', phone:'4566544567'}
    user2={first_name: 'Ajay',last_name: 'Negi', email: 'abcd@g.com', phone:'4565544567'}
    @users_list=[user1,user2]
  end

  describe '#index' do
    it 'returns all users' do
      allow(User).to receive(:all).and_return(@users_list) #mocking
      expect(controller.index).to eq(@users_list)
    end
  end

  describe '#new' do
    it 'should redirect to the create new user page' do
      get :new
      expect(controller.new).to render_template :new
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'creates a user' do
        post :create, user: @valid_params
        expect(User.count).to eq(1)
      end
      it 'redirects to the show action for the new user' do
        post :create, user: @valid_params
        expect(response).to redirect_to profile_path
      end
    end

    context 'with invalid attributes' do
      it 'does not creates a user' do
        post :create, user: @invalid_params
        expect(User.count).to eq(0)
      end
      it 're renders the new view' do
        post :create, user: @invalid_params
        expect(response).to render_template :new
      end
    end
  end

end 
