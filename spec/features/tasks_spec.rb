feature "tasks/index" do
	
	scenario "renders a lists of posts" do

		user = create(:user)
		sign_in(user)

		create(:post1, user: user)
		create(:post2, user: user)

		visit posts_path

		expect(page).to have_content("Post 1")
		expect(page).to have_content("Post 2")
	end

end

feature "New Post" do
	scenario "user add a new post" do
		user = create(:user)
		sign_in(user)
		visit posts_path

		expect {
			click_link 'New Post'
			fill_in 'Title', with: 'Post 1'
			fill_in 'Article', with: 'Article 1'
			select(user.email, from: 'post_user_id')
			click_button('Create Post')
		}.to change(Post, :count).by(1)

	expect(current_path).to eq(post_path(Post.last.id))
	expect(page).to have_content('Post 1')
	end
end


feature "Edit Post" do
	let(:user) {create(:user)}
	let(:post) {create(:post1)}

	scenario "user edits post" do
		sign_in(user)
		visit post_path(post)
		expect(page).to have_content('Post 1')

		click_link "Edit"

		fill_in 'Title', with: 'Post Update'
		fill_in 'Article', with: 'Article Update'
		select(post.user.email, from: 'post_user_id')
			
		click_button('Update Post')

		expect(current_path).to eq(post_path(post.id))
		expect(page).to have_content('Post Update')
	end
end