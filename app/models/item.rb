class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :shipping_charges_id, presence: true
  validates :prefectures_id, presence: true
  validates :estimated_shipping_id, presence: true
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user
end
