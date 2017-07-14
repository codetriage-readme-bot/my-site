require 'rails_helper'

RSpec.describe PicsController, type: :controller do
  context 'for guest users' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in(user)
    end

    let(:valid_attributes) {
      FactoryGirl.attributes_for(:pic, user_id: user.id)
    }

    let(:valid_session) { {} }

    describe 'GET #index' do
      it 'returns a success response' do
        Pic.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        pic = Pic.create! valid_attributes
        get :show, params: { id: pic.to_param }, session: valid_session
        expect(response).to be_success
      end
    end

    describe 'GET #new' do
      it 'redirects to the pics list' do
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to(pics_url)
      end
    end

    describe 'GET #edit' do
      it 'redirects to the pics list' do
        pic = Pic.create! valid_attributes
        get :edit, params: { id: pic.to_param }, session: valid_session
        expect(response).to redirect_to(pics_url)
      end
    end

    describe 'POST #create' do
      it 'does not creates a new Pic' do
        expect {
          post :create, params: { pic: valid_attributes }, session: valid_session
        }.to change(Pic, :count).by(0)
      end

      it 'redirects to the pics list' do
        post :create, params: { pic: valid_attributes }, session: valid_session
        expect(response).to redirect_to(pics_url)
      end
    end

    describe 'PUT #update' do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:pic, description: 'Description is changed')
      }

      it 'does not updates the requested pic' do
        pic = Pic.create! valid_attributes
        pic_params = { id: pic.to_param, pic: new_attributes }
        put :update, params: pic_params, session: valid_session
        pic.reload
        expect(pic.description).to eq(pic.description)
      end

      it 'redirects to the pics list' do
        pic = Pic.create! valid_attributes
        pic_params = { id: pic.to_param, pic: valid_attributes }
        put :update, params: pic_params, session: valid_session
        expect(response).to redirect_to(pics_url)
      end
    end

    describe 'DELETE #destroy' do
      it 'does not destroys the requested pic' do
        pic = Pic.create! valid_attributes
        expect {
          delete :destroy, params: { id: pic.to_param }, session: valid_session
        }.to change(Pic, :count).by(0)
      end

      it 'redirects to the pics list' do
        pic = Pic.create! valid_attributes
        delete :destroy, params: { id: pic.to_param }, session: valid_session
        expect(response).to redirect_to(pics_url)
      end
    end
  end

  context 'for admin user' do
    let(:user) { FactoryGirl.create(:admin) }
    before do
      sign_in(user)
    end

    let(:valid_attributes) {
      FactoryGirl.attributes_for(:pic, user_id: user.id)
    }

    let(:invalid_attributes) {
      FactoryGirl.attributes_for(:pic, user_id: user.id, title: '')
    }

    let(:valid_session) { {} }

    describe 'GET #index' do
      it 'returns a success response' do
        Pic.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        pic = Pic.create! valid_attributes
        get :show, params: { id: pic.to_param }, session: valid_session
        expect(response).to be_success
      end
    end

    describe 'GET #new' do
      it 'returns a success response' do
        get :new, params: {}, session: valid_session
        expect(response).to be_success
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        pic = Pic.create! valid_attributes
        get :edit, params: { id: pic.to_param }, session: valid_session
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Pic' do
          expect {
            post :create, params: { pic: valid_attributes }, session: valid_session
          }.to change(Pic, :count).by(1)
        end

        it 'redirects to the created pic' do
          post :create, params: { pic: valid_attributes }, session: valid_session
          expect(response).to redirect_to(Pic.last)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the :new template)' do
          post :create, params: { pic: invalid_attributes }, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) { FactoryGirl.attributes_for(:pic, description: 'Changed') }

        it 'updates the requested pic' do
          pic = Pic.create! valid_attributes
          pic_params = { id: pic.to_param, pic: new_attributes }
          put :update, params: pic_params, session: valid_session
          pic.reload
          expect(pic.description).to eq('Changed')
        end

        it 'redirects to the pic' do
          pic = Pic.create! valid_attributes
          pic_params = { id: pic.to_param, pic: valid_attributes }
          put :update, params: pic_params, session: valid_session
          expect(response).to redirect_to(pic)
        end
      end

      context 'with invalid params' do
        it 'returns a success response (i.e. to display the :edit template)' do
          pic = Pic.create! valid_attributes
          pic_params = { id: pic.to_param, pic: invalid_attributes }
          put :update, params: pic_params, session: valid_session
          expect(response).to be_success
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested pic' do
        pic = Pic.create! valid_attributes
        expect {
          delete :destroy, params: { id: pic.to_param }, session: valid_session
        }.to change(Pic, :count).by(-1)
      end

      it 'redirects to the pics list' do
        pic = Pic.create! valid_attributes
        delete :destroy, params: { id: pic.to_param }, session: valid_session
        expect(response).to redirect_to(pics_url)
      end
    end
  end
end
