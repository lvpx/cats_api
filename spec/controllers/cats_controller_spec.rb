require 'rails_helper'

RSpec.describe CatsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
        { name: 'Cato', image: fixture_file_upload('cat.jpg', 'image/jpeg') }
      end

      it 'creates a new Cat' do
        expect do
          post :create, params: valid_params
        end.to change(Cat, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        { cat: { name: nil, image: nil } }
      end

      it 'does not create a new Cat' do
        expect do
          post :create, params: invalid_params
        end.to_not change(Cat, :count)
      end

      it 'returns an error response' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #show' do
    let(:cat) { Cat.create(image: fixture_file_upload('cat.jpg', 'image/jpeg')) }

    it 'returns a success response' do
      get :show, params: { id: cat.id }
      expect(response).to be_successful
    end
  end
end
