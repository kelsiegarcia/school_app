class School < ActiveRecord::Base
  validates_presence_of :name, :population, :city, :state
  has_many :courses

  def name_state
    "#{name} is established in the state: #{state}"
  end

  def school_size
    formatted_pop = population.to_i
    if(formatted_pop >= 50)
      "Large"
    elsif(formatted_pop > 15)
      "Medium"
    else
      "Small"
    end
  end
end
