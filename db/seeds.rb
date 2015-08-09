# 99.times do |n|
#   name 	   = Faker::Name.name
#   email    = "example-#{n+1}@top.org"
#   password = "password"
#   Member.create!(name: 				  	name,
# 				 email: 			  	email,
# 				 password: 			  	password,
# 				 password_confirmation: password)
# end

60.times do |n|
  body 		= "".ljust(120, "hello world")
  member_id = 1
  Story.create!(body: body, member_id: member_id)
end
