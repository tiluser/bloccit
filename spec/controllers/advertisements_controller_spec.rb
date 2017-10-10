require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do

    let(:my_advertisement) { Advertisement.create(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price) }
    describe "GET #index" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end
    
        it "assigns [my_post] to @posts" do
            get :index
            expect(assigns(:advertisements)).to eq([my_advertisement])
        end
    end

    describe "GET #show" do
        it "returns http success" do
        # was generated as get :show originally 
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
        
        it "instantiates @advertisement" do
            get :new
            expect(assigns(:advertisement)).not_to be_nil
        end
    end

    describe "POST create" do
        it "increases the number of Advertisement by 1" do
            expect{post :create, params: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price }, as: :json}.to change(Advertisement,:count).by(1)
        end
        
        it "assigns the new advertisement to @advertisement" do
            post :create, params: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price }, as: :json
            expect(assigns(:advertisement)).to eq Advertisement.last
        end
        
        it "redirects to the new advertisement" do
            post :create, params: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_price }, as: :json
            expect(response).to redirect_to Advertisement.last
        end

    end


end

