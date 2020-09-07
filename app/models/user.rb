class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items dependent: :destroy
  # has_many :purchases dependent: :destroy

  validates :nickname             , presence: true

  validates :email                , presence: true, uniqueness: true
  
  validates :password             , presence: true,
             format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,128}\z/,
             message: "は半角6~128文字英小文字・数字それぞれ１文字以上含む必要があります"}

  validates :password_confirmation, presence: true, length: { minimum: 6 }
  
  validates :family_name          , presence: true, 
             format: { with: /\A[ぁ-んァ-ン一-龥]/,
             message: "は全角（漢字・ひらがな・カタカナ）で入力する必要があります"}
  
  validates :first_name          , presence: true, 
             format: { with: /\A[ぁ-んァ-ン一-龥]/,
             message: "は全角（漢字・ひらがな・カタカナ）で入力する必要があります"}

  validates :family_name_kana    , presence: true, 
             format: { with: /\A[ァ-ヶー－]+\z/,
             message: "は全角（カタカナ）で入力する必要があります"}
  
  validates :first_name_kana     , presence: true, 
             format: { with: /\A[ァ-ヶー－]+\z/,
             message: "は全角（カタカナ）で入力する必要があります"}

  validates :birth_date           , presence: true


end
