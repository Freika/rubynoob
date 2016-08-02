# == Schema Information
#
# Table name: repositories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  url         :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :repository do
    name "MyString"
    description "MyString"
    url "MyString"
    user_id 1
  end
end
