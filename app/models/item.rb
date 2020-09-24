class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  # Association
  belongs_to :user
  has_one :order, dependent: :destroy
  has_one_attached :image

  # Validation
  with_options presence: true do
    validates :image

    validates :name, length: { maximum: 40 }

    validates :description, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id

    validates :condition_id

    validates :postage_payer_id

    validates :prefecture_id

    validates :handling_time_id
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円から9,999,999円の間で設定してください' }

end
