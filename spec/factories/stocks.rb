FactoryBot.define do
  factory :stock do
    name {"トマト"}
    stock {1}
    unit {"個"}
    memo {"真っ赤だよ"}
    user
  end
end