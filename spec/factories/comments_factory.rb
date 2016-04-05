FactoryGirl.define do
  factory :comment do
    user
    post
    post_id 4
    content "I'm a random comment. You like that?"
  end

end
