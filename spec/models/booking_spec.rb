require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:animal_name) }
    it { should validate_presence_of(:date_of_service) }
    it { should validate_presence_of(:animal_type) }


    it 'validates that date_of_service is greater than yesterday' do
      booking = build(:booking, date_of_service: Date.yesterday)
      expect(booking).not_to be_valid
      expect(booking.errors[:date_of_service]).to include("must be greater than #{Date.yesterday}")
    end
  end

  describe 'enums' do
    it { should define_enum_for(:animal_type).with_values(cat: 0, dog: 1) }
  end

  describe 'methods' do
    let(:booking) { create(:booking, animal_type: :dog, hours_requested: 3) } # Assuming you're using FactoryBot to create bookings

    it 'calculates the total cost correctly' do
      expect(booking.total_cost).to eq(20 + (10 * 3))
    end

    # Add more method tests as needed
  end
end
