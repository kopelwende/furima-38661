class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, municipality: municipality, address: address,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
