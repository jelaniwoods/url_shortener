require "rails_helper"

RSpec.describe "urls#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/urls/#{url.id}"
  end

  describe "basic destroy" do
    let!(:url) { create(:url) }

    it "updates the resource" do
      expect(UrlResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Url.count }.by(-1)
      expect { url.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
