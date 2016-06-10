require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  let(:school) { FactoryGirl.create(:school)}

  describe "GET #index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets schools instance var' do
      get :index
      expect(assigns[:schools]).to eq([school])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
   
    it 'returns http success' do
      get :show, id: school.id
      expect(response).to have_http_status(:success)
    end

    it 'sets school instance var' do
      get :show, id: school.id
      expect(assigns[:school]).to eq(school)
    end

    it 'renders show template' do
      get :show, id: school.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it 'has http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'sets school instance var' do
      get :new
      @school = assigns[:school]
      expect(@school.id).to be_nil
      expect(@school.class).to eq(School)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do 

    it 'has http success' do
      get :edit, id: school.id
      expect(response).to have_http_status(:success)
    end

    it 'finds the right school' do
      get :edit, id: school.id
      expect(assigns[:school]).to eq(school)
    end

    it 'renders edit template' do
      get :edit, id: school.id
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before(:each) do
      @school_params = {
        school: { name: 'DevPoint', population: "100" }
      }
    end

    it 'has http success' do
      post :create, @school_params
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT #update" do

    it 'has http success' do
      put :update, { id:  school.id, school: { name: 'DevPoint' } }
      expect(response).to have_http_status(302)
    end

    it 'updates the school' do
      put :update, { id: school.id, school: { name: 'DevPoint', population: "100" } }
      expect(school.reload.population).to eq("100")
    end
  end

  describe "DELETE #destroy" do


    it 'has http success' do
      delete :destroy, id: school.id
      expect(response).to have_http_status(302)
    end

    it 'deletes a school' do
      delete :destroy, id: school.id
      expect(School.count).to eq(0)
    end
  end
end