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
end
