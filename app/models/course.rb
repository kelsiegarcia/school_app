class Course < ActiveRecord::Base
  belongs_to :school
  def self.by_name
    order(:name)
  end

  def self.by_size
    order(:size)
  end

  def self.by_subject
    order(:subject)
  end
end
