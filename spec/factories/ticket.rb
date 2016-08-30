FactoryGirl.define do
  factory :ticket do
    aasm_state :unassigned
    association :customer, factory: :user
    association :agent, factory: :user
    title "New Title"
    description "New Description"
  end
end