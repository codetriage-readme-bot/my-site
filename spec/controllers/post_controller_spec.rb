require 'rails_helper'

describe PostsController do
	describe "GET new" do
		it "render :new template" do
			get :new
			expect(response).to render_template(:new)
		end
		it "assign new Post to @post" do
			get :new
			expect(assigns(:post)).to be_a_new(Post)
		end
	end

	describe "GET show" do
		let(:post) { FactoryGirl.create(:simple_post) }

		it "render :show template" do
			get :show, params: { id: post }
			expect(response).to render_template(:show)
		end
		it "assign requested post to @post" do
			get :show, params: { id: post }
			expect(assigns(:post)).to eq(post)
		end
	end

	describe "POST create" do
		context "valid data" do
			let(:valid_data) { FactoryGirl.attributes_for(:simple_post) }
		
			it "redirect to post#show" do
				post :create, params: { post: valid_data }
				expect(response).to redirect_to(post_path(assigns[:post]))
			end
			it "creates new post in database" do
				expect {
					post :create, params: { post: valid_data }
				}.to change(Post, :count).by(1)
			end
		end

		context "invalid data" do
			let(:invalid_data) { FactoryGirl.attributes_for(:simple_post, title: '') }
		
			it "render :new template" do
				post :create, params: { post: invalid_data }
				expect(response).to render_template(:new)
			end
			it "doesn't creates new post in database" do
				expect {
					post :create, params: { post: invalid_data }
				}.not_to change(Post, :count)
			end
		end
	end
end