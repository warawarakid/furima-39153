class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  has_one :order
  
  has_one_attached :image


  #空の投稿を保存できないようにする
  validates :name, :description, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 
end