require 'rails_helper'

RSpec.describe Post, type: :model do
  
	it 'is invalid without a title' do
	 post = build(:post1, title: nil)
	 expect(post).not_to be_valid
	end

	it 'is invalid without an article' do
	 post = build(:post2, article: nil)
	 expect(post).not_to be_valid
	end

  	it 'is valid with required attributes' do
  	 post = build(:post1)
  	 expect(post).to be_valid
    end

  	it 'has a valid factory' do
     expect(FactoryBot.build(:post1)).to be_valid
    end

    it 'has an invalid factory' do
     expect(FactoryBot.build(:invalid_post)).not_to be_valid
    end

    it 'belongs to user' do
     expect(Post.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

end
