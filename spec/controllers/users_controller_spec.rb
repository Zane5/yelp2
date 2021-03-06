require 'spec_helper'

describe UsersController do
  describe "Get new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
    it "render the new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST create" do
    context "with valid input" do
      
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end

      it "creates the user" do
        expect(User.count).to eq(1)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to sign_in_path
      end
    end

    context "with invalid input" do

      before do
        post :create, user: { password_digest: "password", username: "ZZZZ"}
      end

      it "does not create the user" do
        expect(User.count).to eq(0)
      end
      
      it "render the :new template" do
        expect(response).to render_template :new
      end

      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end

  describe "GET show" do
    it "show the current_user profile" do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      get :show, id: alice.id
      expect(assigns(:alice)).to eq(@alice)
    end

    it "show another user profile " do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      tom = Fabricate(:user)
      get :show, id: tom.id
      expect(assigns(:tom)).to eq(@tom)
    end

  end
end
