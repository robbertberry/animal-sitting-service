# spec/requests/bookings_spec.rb
require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe 'GET #index' do
    context 'when user is not signed in' do
      it 'returns a redirect response to sign in page' do
        get bookings_path

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    context 'when user is signed in' do
      before do
        sign_in_user
      end
      
      it 'returns a success response' do
        booking1 = create(:booking)
        booking2 = create(:booking)

        get bookings_path
        expect(response.body).to include(booking1.first_name)
        expect(response.body).to include(booking2.first_name)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe 'GET #new' do
    it 'returns a success response' do
      get new_booking_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new booking' do
        expect {
          post bookings_path, params: { booking: attributes_for(:booking) }
        }.to change(Booking, :count).by(1)
      end

      it 'redirects to the new page' do
        post bookings_path, params: { booking: attributes_for(:booking) }
        expect(response).to redirect_to(new_booking_url)
      end

      it 'returns a success flash message' do
        post bookings_path, params: { booking: attributes_for(:booking) }
        expect(flash[:success]).to eq('Booking added successfully!')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new booking' do
        expect {
          post bookings_path, params: { booking: attributes_for(:booking, first_name: nil) }
        }.not_to change(Booking, :count)
      end

      it 'redirects to the new page' do
        post bookings_path, params: { booking: attributes_for(:booking) }
        expect(response).to redirect_to(new_booking_url)
      end

      it 'returns an error flash message' do
        post bookings_path, params: { booking: attributes_for(:booking, first_name: nil) }
        expect(flash[:error]).to eq('Some error occured!')
      end
    end
  end
end
