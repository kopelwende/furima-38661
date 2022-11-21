class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id,  numericality: {other_than: 1, message: "can't be blank"}
  validates :item_status_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :shipping_charges_id,numericality: {other_than: 1, message: "can't be blank"}
  validates :prefectures_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :estimated_shipping_id,  numericality: {other_than: 1, message: "can't be blank"}
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :estimated_shipping

end
