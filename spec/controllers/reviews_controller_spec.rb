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
      context "with valid inputs" do
        it "redirect to business show page"
        it "create a review"
        it "create a review associated with the business"
        it "create a review associated with the signed in user"
      end
      
      context "with invalid inputs" do
        it "does not create a review"
        it "renders the business/show template"
        it "sets @business"
      end
    end

    context "with unauthenticated users" do
      it "redirects to the sign in page"
    end
  end
end
