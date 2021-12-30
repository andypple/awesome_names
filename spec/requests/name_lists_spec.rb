require 'rails_helper'

RSpec.describe 'NameLists', type: :request do
  describe 'GET /' do
    context 'when visit first time' do
      it 'redirects to new distinct list page' do
        get '/'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/#{NameList.last.uid}")
      end
    end

    context 'when NOT visit first time' do
      let!(:name_list_past) { create(:name_list, viewed_at: 5.days.ago) }
      let!(:name_list_future) { create(:name_list, viewed_at: 2.days.from_now) }

      it 'redirects to most recently view list' do
        get '/'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/#{NameList.last.uid}")

        get '/'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/#{name_list_future.uid}")
      end
    end
  end

  describe 'GET /:name_list_id' do
    context 'when name list is existed' do
      let!(:name_list1) { create(:name_list, viewed_at: 10.days.ago) }
      let!(:name_list2) { create(:name_list, viewed_at: 5.days.ago) }

      it 'updates viewed_at when visited a name list' do
        get '/'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/#{NameList.last.uid}")
        expect { get "/#{name_list1.uid}" }.to change { name_list1.reload.viewed_at }
      end

      it 'renders name list show page' do
        get '/'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/#{NameList.last.uid}")

        follow_redirect!

        expect(response.body).to include("Hello, Baby Name App")
      end
    end

    context 'when name list is not existed' do
      it 'redirects to most recenty view' do
        get '/'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/#{NameList.last.uid}")

        get "/not_exist_name_list"
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/#{NameList.last.uid}")
      end
    end
  end
end
