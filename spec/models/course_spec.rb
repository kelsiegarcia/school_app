require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { FactoryGirl.create(:course) }
    it { should respond_to :name }
    it { should respond_to :size }
    it { should respond_to :subject }
    it { should belong_to :school }

  describe 'class methods'  do
    before(:each) do
      @course1 = Course.create(name: 'Full Stack Rails', size: 'fifteen', subject: 'Ruby Rails' )
      @course2 = Course.create(name: 'Javascript', size: 'ten', subject: 'Javascript')
      @course3 = Course.create(name: 'UX', size: 'five', subject: 'UX')
    end

    it 'sorts by name' do
      courses = Course.by_name
      expect(courses).to eq([@course1, @course2, @course3])
    end

    it 'sorts by size' do
      courses = Course.by_size
      expect(courses).to eq([@course1, @course3, @course2])
    end

    it 'sorts by subject' do
      courses = Course.by_subject
      expect(courses).to eq([@course2, @course1, @course3])
    end
  end
end

