 FactoryBot.define do

  factory :user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    password {Faker::Internet.password}
    
  end

end


def user_with_arguments(arg_count: 1)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:argument, arg_count, user: user)
  end
end