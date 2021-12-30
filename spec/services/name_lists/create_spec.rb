require 'rails_helper'

RSpec.describe NameLists::Create, type: :service do
  describe '#call' do
    let(:name_list) { described_class.new.call }
    it 'creates name list with uid and viewed_at' do
      expect(name_list.uid.length).to eq 12
      expect(name_list.viewed_at.present?).to be_truthy
    end
  end
end
