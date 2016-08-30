FactoryGirl.define do
  factory :comment do
    author_id 1
    body "MyText"
    commentable_type "MyString"
    commentable_id 1
    ticket_id 1
  end
end
