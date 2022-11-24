class OderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :post_code, :prefectures_id, :municipality, :address, :building, :phone_number,:order

  validates, :post_code,  presence: true, format:{with: /\A\d{3}[-]\d{4}\z/ }
  validates, :prefectures_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates, :municipality, presence: true
  validates, :address, presence: true
  validates, :phone_number, presence: true, format:{with: /\A\d{10,11}\z/ }
  validates, :order, presence: true
  validates, :user, presence: true
  validates, :item, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end