FactoryGirl.define do 
	factory :user do
		sequence(:name)   {  |n| "Person #{n}" }
		sequence(:email)  {  |n| "person_#{n}@example.com" }
		password  "negroface"
		password_confirmation "negroface"

		factory :admin do
			admin true
		end
	end

	factory :microlist do
		content "Lorem homo"
		user
 end	
end