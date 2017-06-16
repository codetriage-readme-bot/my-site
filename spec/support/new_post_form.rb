class NewPostForm
	include Capybara::DSL

	def visit_page
		visit '/posts'
		click_on('Create New One')

		self
	end

	def fill_in_with(params = {})
		fill_in('Title', with: params.fetch(:title, 'Make a Post'))
		fill_in('Body', with: 'Post content')

		self
	end

	def submit
		click_on('Create Post')

		self
	end
end