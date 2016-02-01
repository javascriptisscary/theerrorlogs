FactoryGirl.define do
  sequence(:email) { |n| "exampleuser#{n}@example.com" }
  
  
  factory :user do
    
    email
    password "1234567890"
   

  end
end