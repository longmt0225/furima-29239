FactoryBot.define do
  factory :user do
    nickname              { 'furima太郎' }
    email                 { 'sample@gmail.com' }
    password              { 'aaa000' }
    password_confirmation { password }
    family_name           { 'フリマ' }
    first_name            { '太郎' }
    family_name_kana      { 'フリマ' }
    first_name_kana       { 'タロウ' }
    birth_date            { '2020-08-03' }
  end
end