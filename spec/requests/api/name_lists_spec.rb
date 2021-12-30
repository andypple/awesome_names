require 'rails_helper'

RSpec.describe 'Api::NameLists', type: :request do
  describe 'GET /api/name_lists/:id' do
    let!(:name_list) { create(:name_list, viewed_at: 5.days.ago) }

    it 'responses all attributes' do
      get "/api/name_lists/#{name_list.uid}"

      expect(response).to have_http_status(200)
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:uid]).to eq name_list.uid
    end
  end
end
