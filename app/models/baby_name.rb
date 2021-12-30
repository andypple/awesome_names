class BabyName < ApplicationRecord
  belongs_to :name_list
  validates :name, presence: true,
                   format: { with: /\A[a-zA-Z]*\s{0,1}[a-zA-Z]*\Z/i, message: I18n.t('baby_name.format') }
  validates :name, uniqueness: { scope: :name_list_id, message: I18n.t('baby_name.uniq_name') }
end
