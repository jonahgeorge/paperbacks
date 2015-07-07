FactoryGirl.define do
  sequence(:name) { |n| "user#{n}" }
  sequence(:email) { |n| "user#{n}@paperbacks.io" }
  sequence(:password) { |n| "password#{n}" }
  sequence(:isbn) { |n| "#{n}#{n}#{n}" }

  factory :book do
    title "To Kill A Mockingbird"
    author "Harper Lee"
    isbn { generate(:isbn) }
  end

  factory :user do
    name { generate(:name) }
    email { generate(:email) }
    password { generate(:password) }
  end

  factory :listing do
    book { create(:book) }
    user { create(:user) }
    price 50.00
    is_active true
  end
end
