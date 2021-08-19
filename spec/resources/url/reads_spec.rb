require "rails_helper"

RSpec.describe UrlResource, type: :resource do
  describe "serialization" do
    let!(:url) { create(:url) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(url.id)
      expect(data.jsonapi_type).to eq("urls")
    end
  end

  describe "filtering" do
    let!(:url1) { create(:url) }
    let!(:url2) { create(:url) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: url2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([url2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:url1) { create(:url) }
      let!(:url2) { create(:url) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      url1.id,
                                      url2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      url2.id,
                                      url1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
