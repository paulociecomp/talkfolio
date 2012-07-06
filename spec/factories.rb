FactoryGirl.define do
  factory :group do
    name "Ta Safo!"
    description "The best Agile community ever!"
    founder_id 1
  end

  factory :talk do
    title "Write in Ruby!"
    description "Why you should develop in Ruby."
    user_id 1
  end

  factory :talk_submition do
    receiver_id 1
    receiver_type "Group"
    talk_id 1
  end

  factory :base_user, :class => User do
    sequence(:email) { |i| "mail#{i}@mail.com" }
    password "123456"
    password_confirmation "123456"
  end
end