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
  include Scopable
  belongs_to :repository

  validates :number, uniqueness: { scope: :repository_id }

  enum complexity: [:beginner, :intermediate, :proficient]

  scope :opened, -> { where(closed: false) }
  scope :closed, -> { where(closed: true) }

  def update_from_github
    issue =
      Octokit.issue("#{repository.user.username}/#{repository.name}", number)

    update(
      name: issue[:title],
      description: issue[:body],
      closed: Issue.closed?(issue[:state]),
    )
  end

  def self.closed?(state)
    state == 'close' ? true : false
  end
end
