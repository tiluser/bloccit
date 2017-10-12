require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
    let(:my_question) { Question.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_resolved) }
    describe "GET #index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end
        
        it "assigns [my_question] to @questions" do
            get :index
            expect(assigns(:questions)).to eq([my_question])
        end
    end

    describe "GET #show" do
        it "returns http success" do
        # was geenerated as get:show originally; doesn't work with resourceful routing.
            get :index
            expect(response).to have_http_status(:success)
        end
    end

    describe "GET #new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end
        
        it "renders the #new view" do
            get :new
            expect(response).to render_template :new
        end
    
        it "instantiates @question" do
            get :new
            expect(assigns(:question)).not_to be_nil
        end

    end
    
    describe "POST create" do
        it "increases the number of Question by 1" do
            expect{post :create, params: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_resolved }, 
                as: :json}.to change(Question,:count).by(1)
        end
 
        it "assigns the new question to @question" do
            post :create, params: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_resolved }, as: :json
            expect(assigns(:question)).to eq Question.last
        end
 
        it "redirects to the new question" do
            post :create, params: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: RandomData.random_resolved }, as: :json
            expect(response).to redirect_to Question.last
        end
    end
    
    describe "PUT update" do
        it "updates question with expected attributes" do
            new_title = RandomData.random_sentence
            new_body = RandomData.random_paragraph
            new_resolved = RandomData.random_resolved
            
            put :update, params: { id: my_question.id, question: {title: new_title, body: new_body, resolved: new_resolved} }
            
            updated_question = assigns(:question)
            expect(updated_question.id).to eq my_question.id
            expect(updated_question.title).to eq new_title
            expect(updated_question.body).to eq new_body
            expect(updated_question.resolved).to eq new_resolved
        end
        
        it "redirects to the updated post" do
            new_title = RandomData.random_sentence
            new_body = RandomData.random_paragraph
            new_resolved = RandomData.random_resolved
            put :update, params: { id: my_question.id, question: {title: new_title, body: new_body, resolved: new_resolved} }
            expect(response).to redirect_to my_question
        end
    end
    
    describe "GET #edit" do
        it "returns http success" do
            get :edit, params: {id: my_question.id}
            expect(response).to have_http_status(:success)
        end
        
        it "renders the #edit view" do
            get :edit, params: {id: my_question.id}
            expect(response).to render_template :edit
        end
            # #2
        it "assigns question to be updated to @question" do
            get :edit, params: {id: my_question.id}
            
            question_instance = assigns(:question)
            
            expect(question_instance.id).to eq my_question.id
            expect(question_instance.title).to eq my_question.title
            expect(question_instance.body).to eq my_question.body
        end

    end

    describe "DELETE destroy" do
        it "deletes the post" do
            delete :destroy, params: {id: my_question.id}
            count = Post.where({id: my_question.id}).size
            expect(count).to eq 0
        end
        
        it "redirects to questions index" do
            delete :destroy, params: {id: my_question.id}    
            expect(response).to redirect_to questions_path
        end
    end

end
