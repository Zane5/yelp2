require 'spec_helper'

describe BusinessesController do
  describe 'GET new' do
    it 'sets @business to a new Business' do
      get :new
      expect(assigns(:business)).to be_a_new(Business)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    context 'with valid parameters' do
      before { post :create, business: { name: "Business", description: "Words", picture_url: "/images/pizza-166-236.png"}}
      
      it 'create a new bussiness' do
        expect(Business.first).not_to be_nil
      end

      it 'sets the flash success' do
        expect(flash[:success]).not_to be_blank
      end
      
      it 'redirects to the business_path' do
        expect(response).to redirect_to businesses_path
      end
    end

    context 'with invalid parameters' do
      before { post :create, business: {description: "Words", picture_url: "/images/pizza-166-236.png"}}

      it 'does not create a new business' do
        expect(Business.first).to be_nil
      end

      it 'sets the falsh danger' do
        expect(flash[:danger]).not_to be_blank
      end

      it 'redners the new template' do
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET show' do
    it 'sets @business' do
      business = Fabricate(:business)
      get :show, id: business.id
      expect(assigns(:business)).to eq(business)
    end
  end
end
