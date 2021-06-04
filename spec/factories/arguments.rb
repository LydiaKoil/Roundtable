FactoryBot.define do

  factory :argument, class: Argument do

    title{ Faker::Quote.robin }
    body { Faker::Quote.robin}
    created_at {DateTime.now}
    reply_type {nil}
    argument_id {nil}
    user

  end
end

def argument_with_pros_cons(arguments_count:2)
	FactoryBot.create(:argument) do |argument|
	   FactoryBot.create_list(:argument, arguments_count, argument_id: argument.id, reply_type: :pro)
	   FactoryBot.create_list(:argument, arguments_count, argument_id: argument.id, reply_type: :con)
	  end
  end



















