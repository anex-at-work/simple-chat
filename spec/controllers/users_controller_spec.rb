require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
      expect(assigns(:users)).to be
    end
  end

  describe 'PUT update' do
    it 'must update nickname' do
      user = FactoryGirl.create :user
      nickname = Faker::Internet.user_name
      put :update, params: {id: user.id, users: {nickname: nickname}}, format: :json
      expect(response.code).to eq '200'
      user.reload
      expect(user.nickname).to eq nickname
    end
  end

  describe 'PATCH scenario_jquery_interval' do
    it 'must prepare patch data' do
      user = FactoryGirl.create :user
      patch :scenario_jquery_interval, params: {users: {user.id => (user.nickname + 'diff')}}, format: :json
      expect(response.code).to eq '200'
      json = JSON.parse(response.body)
      expect(json[0]).to be
      expect(json[0]['nickname']).to eq user.nickname
    end
  end
end
