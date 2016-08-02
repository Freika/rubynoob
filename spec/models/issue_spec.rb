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

require 'rails_helper'

describe Issue, type: :model do
  it { should belong_to :repository }
  it { should validate_uniqueness_of(:number).scoped_to(:repository_id) }
end
