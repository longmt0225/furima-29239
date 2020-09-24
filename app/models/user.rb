class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one  :card

  # Validation
  validates :nickname, presence: true

  validates :email, presence: true, uniqueness: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,128}\z/.freeze
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX,
                                 message: 'は英字と数字の両方を含めて設定してください' }

  validates :password_confirmation, presence: true, length: { minimum: 6 }

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze

  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :family_name, presence: true,
                          format: { with: NAME_REGEX,
                                    message: 'を全角で入力してください' }

  validates :first_name, presence: true,
                         format: { with: NAME_REGEX,
                                   message: 'を全角で入力してください' }

  validates :family_name_kana, presence: true,
                               format: { with: NAME_KANA_REGEX,
                                         message: 'を全角カタカナで入力してください' }

  validates :first_name_kana, presence: true,
                              format: { with: NAME_KANA_REGEX,
                                        message: 'を全角カタカナで入力してください' }

  validates :birth_date, presence: true
end
