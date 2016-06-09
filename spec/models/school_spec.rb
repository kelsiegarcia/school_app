require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'validations' do
    it { should validate_presence_of (:name) }
    it { should validate_presence_of :population }
    it { should validate_presence_of :state }
  end

  describe '#name_state' do
    it 'returns name and population message' do
      school = School.create(name: 'DevPoint', 
                               population: '500', 
                               state: 'Utah')
      expect(school.name_state).to eq("#{school.name} is established in the state: #{school.state}")
    end
  end

  describe "school_size" do
    it "returns large if school size is > 500" do
      school = School.create(name: 'DevPoint', 
                               population: '600', 
                               state: 'Utah')
      expect(school.school_size).to eq('Large')
    end

    it "return large if school size is == 500" do
      school = School.create(name: 'DevPoint', 
                               population: '500', 
                               state: 'Utah')
      expect(school.school_size).to eq('Large')
    end

    it "returns medium if school size is > 150" do
      school = School.create(name: 'DevPoint', 
                               population: '250', 
                               state: 'Utah')
      expect(school.school_size).to eq('Medium')
    end

    it "returns small if school size < 150" do
      school = School.create(name: 'DevPoint', 
                               population: '10', 
                               state: 'Utah')
      expect(school.school_size).to eq('Small')
    end
  end
end
