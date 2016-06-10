require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:course) { FactoryGirl.create(:course)}

  describe "GET #index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets courses instance var' do
      get :index
      expect(assigns[:courses]).to eq([course])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
   
    it 'returns http success' do
      get :show, id: course.id
      expect(response).to have_http_status(:success)
    end

    it 'sets course instance var' do
      get :show, id: course.id
      expect(assigns[:course]).to eq(course)
    end

    it 'renders show template' do
      get :show, id: course.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it 'has http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'sets course instance var' do
      get :new
      @course = assigns[:course]
      expect(@course.id).to be_nil
      expect(@course.class).to eq(Course)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do 

    it 'has http success' do
      get :edit, id: course.id
      expect(response).to have_http_status(:success)
    end

    it 'finds the right course' do
      get :edit, id: course.id
      expect(assigns[:course]).to eq(course)
    end

    it 'renders edit template' do
      get :edit, id: course.id
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    before(:each) do
      @course_params = {
        course: { name: 'Full Stack Ruby', size: '15', subject: 'Ruby' }
      }
    end

    it 'has http success' do
      post :create, @course_params
      expect(response).to have_http_status(302)
    end
  end

  describe "PUT #update" do

    it 'has http success' do
      put :update, {id: course.id, course: {name: 'new name'}}
      expect(response).to have_http_status(302)
    end

    it 'updates the course' do
      put :update, {id: course.id, course: {name: 'new name'}}
      expect(course.reload.name).to eq('new name')
    end

    it 'redirects to the show page on success' do
      put :update, {id: course.id, course: {name: 'new name'}}
      expect(response).to redirect_to(course_path)
    end
  end

  describe "DELETE #destroy" do


    it 'has http success' do
      delete :destroy, id: course.id
      expect(response).to have_http_status(302)
    end

    it 'deletes a course' do
      delete :destroy, id: course.id
      expect(Course.count).to eq(0)
    end
  end
end