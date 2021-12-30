class BabyName < ApplicationRecord
  belongs_to :name_list
  validates :name, presence: true
  validates :name, uniqueness: { scope: :name_list_id, message: I18n.t('baby_name.uniq_name') }
end
