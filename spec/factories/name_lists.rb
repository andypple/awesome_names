FactoryBot.define do
  factory :name_list do
    uid { SecureRandom.base58(12) }
    viewed_at { Time.current }
  end
end
