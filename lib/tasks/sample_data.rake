namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Example User",
			         email: "Exampleuser@example.com",
			         password: "Poobar",
			         password_confirmation: "Poobar")
		admin.toggle!(:admin)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@example.com"
			password = "password"
			User.create!(name: name,
				         email: email,
				         password: password,
				         password_confirmation: password)
		end
	end
end
