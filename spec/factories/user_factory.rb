FactoryGirl.define do
  sequence(:email) { |n| "exampleuser#{n}@example.com" }
  sequence(:first_name) { |n| "John#{n}" }
  sequence(:last_name) { |n| "Smith#{n}" }
  
  
  factory :user do
    
    email
    first_name
    last_name
    password "1234567890"
   

  end
end