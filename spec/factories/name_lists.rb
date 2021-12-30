FactoryBot.define do
  factory :name_list do
    uid { SecureRandom.base58(12) }
  end
end
