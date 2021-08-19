require "rails_helper"

RSpec.describe "urls#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/urls/#{url.id}", payload
  end

  describe "basic update" do
    let!(:url) { create(:url) }

    let(:payload) do
      {
        data: {
          id: url.id.to_s,
          type: "urls",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UrlResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { url.reload.attributes }
    end
  end
end
