require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入できる時' do
    it '全ての項目を正常に入力すると購入できる' do
      expect(@order_address).to be_valid
    end

    it 'birdingが空白でも購入できる' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
  end

  describe '購入できない時' do
    it 'userが紐づいていないと購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐づいていないと購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'post_codeが空だと購入できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid')
    end

    it 'post_codeが英字だと購入できない' do
      @order_address.post_code = 'abcdefg'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid')
    end

    it 'post_codeが全角だと購入できない' do
      @order_address.post_code = '１１１−１１１１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid')
    end

    it 'prefectures_idが空だと購入できない' do
      @order_address.prefectures_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
    end

    it 'municipalityが空だと購入できない' do
      @order_address.municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空だと購入できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと購入できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが英字だと購入できない' do
      @order_address.phone_number = 'abcdefg'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが全角だと購入できない' do
      @order_address.phone_number = '１２３４５６７８９００'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空では登録できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
