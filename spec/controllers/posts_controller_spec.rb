require 'rails_helper'
 # #4
 include SessionsHelper

 RSpec.describe PostsController, type: :controller do
   let(:my_user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }

 # #5
   context "guest user" do
 # #6
     describe "GET show" do
       it "returns http success" do
         get :show, params: { topic_id: my_topic.id, id: my_post.id }
         expect(response).to have_http_status(:success)
       end
 
       it "renders the #show view" do
         get :show, params: { topic_id: my_topic.id, id: my_post.id }
         expect(response).to render_template :show
       end
 
       it "assigns my_post to @post" do
         get :show, params: { topic_id: my_topic.id, id: my_post.id }
         expect(assigns(:post)).to eq(my_post)
       end
     end
 
 # #7
     describe "GET new" do
       it "returns http redirect" do
         get :new, params: { topic_id: my_topic.id }
 # #8
         expect(response).to redirect_to(new_session_path)
       end
     end
 
     describe "POST create" do
       it "returns http redirect" do
         post :create, params: { topic_id: my_topic.id, post: { params: { title: RandomData.random_sentence, body: RandomData.random_paragraph} } }
         expect(response).to redirect_to(new_session_path)
       end
     end
 
     describe "GET edit" do
       it "returns http redirect" do
         get :edit, params: { topic_id: my_topic.id, id: my_post.id }
         expect(response).to redirect_to(new_session_path)
       end
     end
 
     describe "PUT update" do
       it "returns http redirect" do
         new_title = RandomData.random_sentence
         new_body = RandomData.random_paragraph
 
         put :update, params: { topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body }}
         expect(response).to redirect_to(new_session_path)
       end
     end
 
     describe "DELETE destroy" do
       it "returns http redirect" do
         delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
         expect(response).to have_http_status(:redirect)
       end
     end
   end
   
    # #13
   context "signed-in user" do
     before do
       create_session(my_user)
     end

     describe "GET show" do
       it "returns http success" do
         get :show, params: { topic_id: my_topic.id, id: my_post.id }
         expect(response).to have_http_status(:success)
       end

       it "renders the #show view" do
         get :show, params: { topic_id: my_topic.id, id: my_post.id }
         expect(response).to render_template :show
       end

       it "assigns my_post to @post" do
         get :show, params: { topic_id: my_topic.id, id: my_post.id }
         expect(assigns(:post)).to eq(my_post)
       end
     end

     describe "DELETE destroy" do
       it "deletes the post" do
         delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
         count = Post.where({id: my_post.id}).size
         expect(count).to eq 0
       end

       it "redirects to topic show" do
         delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
         expect(response).to redirect_to my_topic
       end
     end
   end
end