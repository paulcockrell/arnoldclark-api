require 'spec_helper'

describe ImageManager do
  describe "public methods" do
    context "valid parameters sent to find method" do
      it "returns 12 items where each item has present set to true" do 
        results = ImageManager.find("SK61ZWG", "ARNBCF-U-18233")
        results_present_count = results.select {|r| r.present}.count
        expect(results_present_count).to eq 12
      end
    end
    context "invalid parameters sent to find method" do
      it "returns 12 items where each item has present set to false" do 
        results = ImageManager.find("ABC", "1234567890")
        results_present_count = results.select {|r| r.present}.count
        expect(results_present_count).to eq 0
      end
    end
  end
end
