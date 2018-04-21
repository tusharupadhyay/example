FactoryGirl.define do
  factory :invalid_terminal, class: Terminal do
    name nil
  end
end
