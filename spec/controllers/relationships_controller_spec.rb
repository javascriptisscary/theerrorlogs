require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do


  describe 'Relationships#Index (friends_posts)' do


    context 'user not signed in' do

      it 'will redirect' do
        get :index
        expect(response).to redirect_to(user_session_path)
      end
    end



    context 'user signed in' do
      before do
        @user = create(:user)
        sign_in @user
      end

      it 'has http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

  end



end
