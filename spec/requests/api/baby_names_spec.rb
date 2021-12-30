require 'rails_helper'

RSpec.describe 'Api::BabyNames', type: :request do
  describe 'POST /api/baby_names' do
    let(:name_list) { create(:name_list) }
    context 'with valid params' do
      let(:baby_name_attrs) { attributes_for(:baby_name) }

      it 'adds a baby names to a name list' do
        post '/api/baby_names', params: { baby_name: baby_name_attrs.merge(name_list_id: name_list.id) }

        expect(response).to have_http_status(201)
        body = JSON.parse(response.body).with_indifferent_access
        expect(body[:name_list_id]).to eq name_list.id
      end
    end

    context 'with invalid params' do
      before do
        create(:baby_name, name_list_id: name_list.id, name: "Hello")
      end

      it 'returns errors when duplicated names' do
        post '/api/baby_names', params: { baby_name: { name: "Hello".upcase, name_list_id: name_list.id } }

        expect(response).to have_http_status(422)
        body = JSON.parse(response.body).with_indifferent_access
        expect(body[:error]).to eq "Name is already existed in this list."
      end
    end
  end
end
