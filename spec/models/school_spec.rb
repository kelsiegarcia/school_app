require 'rails_helper'

RSpec.describe School, type: :model do
  let(:school) { FactoryGirl.create(:school)}
  describe 'validations' do
    it { should validate_presence_of (:name) }
    it { should validate_presence_of :population }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should have_many :courses }
  end

  describe '#name_state' do
    it 'returns name and population message' do
      expect(school.name_state).to eq("#{school.name} is established in the state: #{school.state}")
    end
  end

  describe "school_size" do
    it "returns large if school size is > 50" do
      expect(school.school_size).to eq('Large')
    end

    it "return large if school size is == 50" do
      expect(school.school_size).to eq('Large')
    end

    it "returns medium if school size is > 15" do
      expect(school.school_size).to eq('Medium')
    end

    it "returns small if school size < 15" do
      expect(school.school_size).to eq('Small')
    end
  end
end
