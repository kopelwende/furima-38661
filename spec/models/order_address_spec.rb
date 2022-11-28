require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe "購入できる時" do
    it "全ての項目を正常に入力すると購入できる" do
    expect(@order_address).to be_valid
    end

    it "birdingが空白でも購入できる" do
    end
  end

  describe "購入できない時" do
    it "userが紐づいていないと登録できない" do
    end

    it "itemが紐づいていないと登録できない" do
    end

    it "post_codeが空だと登録できない" do
    end

    it "post_codeが英字だと登録できない" do
    end

    it "post_codeが全角だと登録できない" do
    end

    it"prefectures_idが空だと登録できない" do
    end
    
    it"municipalityが空だと登録できない" do
    end
    
    it"addressが空だと登録できない" do
    end
    
    it"phone_numberが空だと登録できない" do
    end

    it "phone_numberが英字だと登録できない" do
    end

    it "phone_numberが全角だと登録できない" do
    end
  end
end

