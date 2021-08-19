require "rails_helper"

RSpec.describe "urls#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/urls", params: params
  end

  describe "basic fetch" do
    let!(:url1) { create(:url) }
    let!(:url2) { create(:url) }

    it "works" do
      expect(UrlResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["urls"])
      expect(d.map(&:id)).to match_array([url1.id, url2.id])
    end
  end
end
