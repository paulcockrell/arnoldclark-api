require 'spec_helper'

describe Image do
  describe "test validations" do
    context "validates presence of" do
      [:camera_angle, :image_size, :registration, :stock_reference].each do |attr|
        it { should validate_presence_of(attr) }
      end
    end
    context "validates length of" do
      it { should ensure_length_of(:stock_reference).is_at_least(9) }
    end
  end

  describe "creation" do
    context "valid attributes" do 
      it "should be valid" do
        image = FactoryGirl.build(:image)
        image.should be_valid
      end
    end
    context "invalid attributes" do
      it "should be invalid" do
        image = FactoryGirl.build(:image, :camera_angle => nil)
        image.should_not be_valid
      end
    end
  end

  describe "public methods" do
    context "valid image instance obfuscated key" do
      image = FactoryGirl.build(:image)
      it "generates valid string" do 
        expect(image.obfuscated_key).to eq "AGRWNZB1C6FK-S-"
      end
    end
    context "invalid image instance obfuscated key" do
      image = FactoryGirl.build(:image, :registration => nil)
      it "generates empty string" do 
        expect(image.obfuscated_key).to eq ""
      end
    end
    context "valid image instance url" do
      image = FactoryGirl.build(:image)
      it "generates valid url" do
        expect(image.url).to eq "http://imagecache.arnoldclark.com/imageserver/AGRWNZB1C6FK-S-/300/f"
      end
    end
    context "invalid image instance url" do
      image = FactoryGirl.build(:image, :camera_angle => nil)
      it "generates empty string" do
        expect(image.url).to eq ""
      end
    end
  end
end
