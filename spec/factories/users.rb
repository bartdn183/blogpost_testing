FactoryBot.define do
 factory :user, class: User do
  	username "bartdn183"
    email { FFaker::Internet.email}
    password 'Password1'
    encrypted_password 'Password1'

    factory :user_with_posts do
	    after(:build) do |user|
	    	[:post1, :post2].each do |post|
	    		user.posts << FactoryBot.build_stubbed(:post1, user: user)
	    	end
	    end
	end
  end

  factory :invalid_user, class: User do
    username nil
    email nil
  end
end
