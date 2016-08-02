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

require 'rails_helper'

describe Repository, type: :model do
  it { should belong_to :user }
  it { should have_many :issues }
  it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
end
