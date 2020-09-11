class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handling_time

  # Association
  belongs_to :user
  has_one :purchase, dependent: :destroy
  has_one_attached :image

  # Validation
  validates :image, presence: true

  validates :name, presence: true, length: { maximum: 40 }

  validates :description, presence: true, length: { maximum: 1000 }

  # validates :user, presence: true, foreign_key: true

  validates :category_id, presence: true, numericality: { other_than: 1, message: 'Select' }

  validates :condition_id, presence: true, numericality: { other_than: 1, message: 'Select' }

  validates :postage_payer_id, presence: true, numericality: { other_than: 1, message: 'Select' }

  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'Select' }

  validates :handling_time_id, presence: true, numericality: { other_than: 1, message: 'Select' }

  validates :price, presence: true, numericality: { greater_than: 300, less_than: 10_000_000, message: 'Out of setting range' }
end
