require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {build_stubbed(:user)}
  let(:user_with_posts) {build(:user_with_posts)}
  
  it 'is invalid without a username' do
    user.username = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is valid with required attributes' do
    expect(user).to be_valid
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'has an invalid factory' do
    expect(FactoryBot.build(:invalid_user)).not_to be_valid
  end

  it 'is invalid without unique email' do
    user = create(:user)
    other_user = build(:user, email: user.email)
    other_user.valid?

    expect(other_user.errors[:email]).to include("has already been taken")
  end

  it 'has many posts' do
    expect(user_with_posts.posts.length).to eq(2)
  end

end
