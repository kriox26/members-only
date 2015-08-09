99.times do |n|
  name 	   = Faker::Name.name
  email    = "example-#{n+1}@top.org"
  password = "password"
  Member.create!(name: 				  	name,
				 email: 			  	email,
				 password: 			  	password,
				 password_confirmation: password)
end
