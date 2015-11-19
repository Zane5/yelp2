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
end
