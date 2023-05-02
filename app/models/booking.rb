class Booking < ActiveRecord::Base
  belongs_to :user, optional: true
  
  validates :first_name, :last_name, :animal_name, :date_of_service, :animal_type, presence: :true
  validates :date_of_service, comparison: { greater_than: Date.yesterday }
  
  enum animal_type: { cat: 0, dog: 1 }

  def total_cost
    20 + (dog? ? 10 : 5) * hours_requested
  end
end