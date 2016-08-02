# == Schema Information
#
# Table name: issues
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :string
#  url           :string
#  repository_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  number        :integer          default(0), not null
#  closed        :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :issue do
    name "MyString"
    description "MyString"
    url "MyString"
    repository_id 1
  end
end
