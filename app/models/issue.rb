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

class Issue < ApplicationRecord
  COMPLEXITY = %w(beginner intermediate proficient)
  belongs_to :repository

  validates :number, uniqueness: { scope: :repository_id }

  enum complexity: [:beginner, :intermediate, :proficient]

  def self.assign_complexity(data)
    labels = data[:labels].map { |l| l[:name].downcase }

    data[:complexity] = (labels && COMPLEXITY).first.to_sym

    data
  end
end
