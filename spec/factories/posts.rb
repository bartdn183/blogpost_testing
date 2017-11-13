FactoryBot.define do
  factory :post1, class: Post do
    association :user
    title "Post 1"
    article "Article 1"
  end

  factory :post2, class: Post do
    association :user
    title "Post 2"
    article "Article 2"
  end

  factory :invalid_post, class: Post do
    association :user
  	title nil
  	article nil
  end
end
