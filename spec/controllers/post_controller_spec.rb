require 'rails_helper'

describe PostsController do

	describe "guest user" do
		
		describe "GET index" do
			it "render :index template" do 
				get :index
				expect(response).to render_template(:index)
			end
			it "assign post to templste" do
				post = FactoryGirl.create(:admin_post)
				get :index
				expect(assigns(:posts)).to match_array([post])
			end
		end

		describe "GET show" do
			let(:post) { FactoryGirl.create(:admin_post) }

			it "render :show template" do
				get :show, params: { id: post }
				expect(response).to render_template(:show)
			end
			it "assign requested post to @post" do
				get :show, params: { id: post }
				expect(assigns(:post)).to eq(post)
			end
		end

		describe "GET new" do
			it "redirect to login page" do
				get :new
				expect(response).to redirect_to(new_user_session_url)
			end
		end

		describe "POST create" do
			it "redirect to login page" do
				post :create, params: { post: FactoryGirl.attributes_for(:admin_post) }
				expect(response).to redirect_to(new_user_session_url)
			end
		end

		describe "GET edit" do
			it "redirect to login page" do
				get :edit, params: { id: FactoryGirl.create(:admin_post) }
				expect(response).to redirect_to(new_user_session_url)
			end
		end

		describe "PUT update" do
			it "redirect to login page" do
				post :update, params: { 
					id: FactoryGirl.create(:admin_post),
					post: FactoryGirl.attributes_for(:admin_post, title: "New Post") 
				}
				expect(response).to redirect_to(new_user_session_url)
			end
		end

		describe "DELETE destroy" do
			it "redirect to login page" do
				delete :destroy, params: { id: FactoryGirl.create(:admin_post) }
				expect(response).to redirect_to(new_user_session_url)
			end
		end
	end # describe guest user

  describe "simple user" do
  	let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in(user)
		end

		describe "GET index" do
			it "render :index template" do 
				get :index
				expect(response).to render_template(:index)
			end
			it "assign admin post to templste" do
				admin_post = FactoryGirl.create(:admin_post)
				get :index
				expect(assigns(:posts)).to match_array([admin_post])
			end
		end

		describe "GET show" do
			let(:post) { FactoryGirl.create(:admin_post) }

			it "render :show template" do
				get :show, params: { id: post }
				expect(response).to render_template(:show)
			end
			it "assign requested post to @post" do
				get :show, params: { id: post }
				expect(assigns(:post)).to eq(post)
			end
		end

		describe "GET new" do
			it "redirect to posts page" do
				get :new
				expect(response).to redirect_to(posts_path)
			end
		end

		describe "POST create" do
			it "redirect to posts page" do
				post :create, params: { post: FactoryGirl.attributes_for(:admin_post) }
				expect(response).to redirect_to(posts_path)
			end
		end

		describe "GET edit" do
			it "redirect to posts page" do
				get :edit, params: { id: FactoryGirl.create(:admin_post) }
				expect(response).to redirect_to(posts_path)
			end
		end

		describe "PUT update" do
			it "redirect to posts page" do
				post :update, params: { 
					id: FactoryGirl.create(:admin_post),
					post: FactoryGirl.attributes_for(:admin_post, title: "New Post") 
				}
				expect(response).to redirect_to(posts_path)
			end
		end

		describe "DELETE destroy" do
			it "redirect to posts page" do
				delete :destroy, params: { id: FactoryGirl.create(:admin_post) }
				expect(response).to redirect_to(posts_path)
			end
		end
  end # describe simple user

	describe "admin user" do
		let(:user) { FactoryGirl.create(:admin) }
		before do
			sign_in(user)
		end

		describe "GET index" do
      let(:post) { FactoryGirl.create(:admin_post) }

			it "render :index template" do 
				get :index
				expect(response).to render_template(:index)
			end
			it "assign admin post to templste" do
				get :index
				expect(assigns(:posts)).to match_array([post])
			end
		end

		describe "GET show" do
			let(:post) { FactoryGirl.create(:admin_post) }

      it "render :show template" do
				get :show, params: { id: post }
				expect(response).to render_template(:show)
			end
			it "assign requested post to @post" do
				get :show, params: { id: post }
				expect(assigns(:post)).to eq(post)
			end
		end

		describe "GET new" do
			let(:post) { FactoryGirl.create(:admin_post) }

      it "render :new template" do
				get :new
				expect(response).to render_template(:new)
			end
			it "assign new Post to @post" do
				get :new
				expect(assigns(:post)).to be_a_new(Post)
			end
		end

		describe "POST create" do
			context "valid data" do
				let(:valid_data) { FactoryGirl.attributes_for(:admin_post) }
			
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
				let(:invalid_data) { FactoryGirl.attributes_for(:admin_post, title: '') }
			
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

		describe "GET edit" do
			let(:post) { FactoryGirl.create(:admin_post) }

      it "render :edit template" do
				get :edit, params: { id: post }
				expect(response).to render_template(:edit)
			end
			it "assign the requested post to template" do
				get :edit, params: { id: post }
				expect(assigns(:post)).to eq(post)
			end
		end

		describe "PUT update" do
      let(:post) { FactoryGirl.create(:admin_post) }

			context "valid data" do
				let(:valid_data) { FactoryGirl.attributes_for(:post, title: "New Post") }

				it "redirect to posts#show" do
					put :update, params: { id: post, post: valid_data }
					expect(response).to redirect_to(post) 
				end
	      it "update post in the daatabase" do
	      	put :update, params: { id: post, post: valid_data }
	      	post.reload
	      	expect(post.title).to eq("New Post")
	      end
			end

			context "invalid data" do
				let(:invalid_data) { FactoryGirl.attributes_for(:post, title: "", body: "new") }

				it "render :edit template" do
					put :update, params: { id: post, post: invalid_data }
					expect(response).to render_template(:edit)
				end
				it "doesn't update post in the database" do
					put :update, params: { id: post, post: invalid_data }
					post.reload
	      	expect(post.body).not_to eq("New")
				end
			end
		end

		describe "DELETE destroy" do
			let(:post) { FactoryGirl.create(:admin_post) }

      it "redirect to posts#index" do
				delete :destroy, params: { id: post }
				expect(response).to redirect_to(posts_path)
			end
			it "delete post from database" do
				delete :destroy, params: { id: post }
				expect(Post.exists?(post.id)).to be_falsy
			end
		end
	end # describe admin user

end