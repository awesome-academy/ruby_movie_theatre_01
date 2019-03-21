# FactoryBot.define do
#   factory :user do
#     sequence(:id) { |n| n }
#     sequence(:name) { |n| "foo#{n}" }
#     email { "#{name}@example.com" }
#     password_digest User.digest('password')
#   end
# end
