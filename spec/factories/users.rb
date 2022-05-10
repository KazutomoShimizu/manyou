FactoryBot.define do
  factory :user do
    name { "sam" }
    email { "sam@sam.com" }
    password { "111111" }
    admin { "true" }
  end
  factory :second_user, class: User do
    name { "sam1" }
    email { "sam1@sam.com" }
    password { "111111" }
    admin { "false" }
  end
end
