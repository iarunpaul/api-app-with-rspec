require 'rails_helper'

RSpec.describe 'Bookings API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:hotel) { create(:hotel) }
  let!(:bookings) { create_list(:booking, 20, hotel_id: hotel.id, user_id: user.id) }
  let(:hotel_id) { hotel.id }
  let(:id) { bookings.first.id }

  # Test suite for GET /hotels/:hotel_id/bookings
  describe 'GET /hotels/:hotel_id/bookings' do
    before { get "/hotels/#{hotel_id}/bookings" }

    context 'when hotel exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all hotel bookings' do
        expect(json.size).to eq(20)
      end
    end

    context 'when hotel does not exist' do
      let(:hotel_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Hotel with 'id'=0/)
      end
    end
  end

  # Test suite for GET /hotels/:hotel_id/bookings/:id
  describe 'GET /hotels/:hotel_id/bookings/:id' do
    before { get "/hotels/#{hotel_id}/bookings/#{id}" }

    context 'when hotel booking exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the booking' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when hotel booking does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Booking/)
      end
    end
  end

  # Test suite for PUT /hotels/:hotel_id/bookings
  describe 'POST /hotels/:hotel_id/bookings' do
    let(:valid_attributes) { { booking_reference: 'Ref:1234', payment_status: false } }

    context 'when request attributes are valid' do
      before { post "/hotels/#{hotel_id}/bookings", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/hotels/#{hotel_id}/bookings", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Booking reference can't be blank/)
      end
    end
  end

  # Test suite for PUT /hotels/:hotel_id/bookings/:id
  describe 'PUT /hotels/:hotel_id/bookings/:id' do
    let(:valid_attributes) { {  payment_status: true } }

    before { put "/hotels/#{hotel_id}/bookings/#{id}", params: valid_attributes }

    context 'when booking exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the booking' do
        updated_booking = Booking.find(id)
        expect(updated_booking.payment_status).to match(true)
      end
    end

    context 'when the booking does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Booking/)
      end
    end
  end

  # Test suite for DELETE /hotels/:id
  describe 'DELETE /hotels/:id' do
    before { delete "/hotels/#{hotel_id}/bookings/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end