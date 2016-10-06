require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'GET index' do
    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
      expect(assigns(:messages)).to be
    end
  end
end
