require "rails_helper"

RSpec.describe "urls#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/urls/#{url.id}", params: params
  end

  describe "basic fetch" do
    let!(:url) { create(:url) }

    it "works" do
      expect(UrlResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("urls")
      expect(d.id).to eq(url.id)
    end
  end
end
