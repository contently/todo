FactoryBot.define do
  factory :user do
    email {|n| "username_#{SecureRandom.hex}@test.com" }
    password {'fakepassword'}
  end

end
