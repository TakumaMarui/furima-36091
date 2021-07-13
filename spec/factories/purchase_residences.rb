FactoryBot.define do
  factory :purchase_residence do
    postal_code { "123-4567" }
    prefecture_id { 2 }
    city { "あ" }
    house_number { "1-1" }
    building_name { "あ" }
    phone_number { "09012345678" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
