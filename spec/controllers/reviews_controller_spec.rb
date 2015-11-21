require 'spec_helper'

describe ReviewsController do

  describe "GET index" do
    it "sets @reviews to the reviews of the logged in user" do
      alice = Fabricate(:user)
      set_current_user(alice)
      review_1 = Fabricate(:review, user: alice)
      review_2 = Fabricate(:review, user: alice)
      get :index
      expect(assigns(:reviews)).to match_array([review_1, review_2])
    end
  end

  describe "POST create" do
    context "with authenticated users" do

      let(:current_user) { Fabricate(:user) }
      before { session[:user_id] = current_user.id }

      context "with valid inputs" do
        it "redirect to business show page" do
          business = Fabricate(:business)
          post :create, review: Fabricate.attributes_for(:review), business_id: business.id
          expect(response).to redirect_to business
        end

        it "create a review" do
          business = Fabricate(:business)
          post :create, review: Fabricate.attributes_for(:review), business_id: business.id
          expect(Review.count).to eq(1)
        end

        it "create a review associated with the business" do
          business = Fabricate(:business)
          post :create, review: Fabricate.attributes_for(:review), business_id: business.id
          expect(Review.first.business).to eq(business)
        end
        
        it "create a review associated with the signed in user" do
          business = Fabricate(:business)
          post :create, review: Fabricate.attributes_for(:review), business_id: business.id
          expect(Review.first.user).to eq(current_user)
        end

      end
      
      context "with invalid inputs" do
        it "does not create a review" do
          business = Fabricate(:business)
          post :create, review: { created_at: 1.day.ago }, business_id: business.id
          expect(Review.count).to eq(0)
        end

        it "renders the business/show template" do
          business = Fabricate(:business)
          post :create, review: { created_at: 1.day.ago }, business_id: business.id
          expect(response).to redirect_to business
        end

        it "sets @business" do
          business = Fabricate(:business)
          review = Fabricate(:review, business: business)
          post :create, review: { created_at: 1.day.ago }, business_id: business.id
          expect(assigns(:reviews)).to match_array([review])
        end
      end
    end

    context "with unauthenticated users" do
      it "redirects to the sign in page"
    end
  end
end
