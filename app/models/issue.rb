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
  COMPLEXITY = %w(beginner intermediate proficient)
  belongs_to :repository

  validates :number, uniqueness: { scope: :repository_id }

  enum complexity: [:beginner, :intermediate, :proficient]

  scope :opened, -> { where(closed: false) }
  scope :closed, -> { where(closed: true) }

  delegate :username, to: :issue, prefix: :owner

  def self.assign_complexity(data)
    labels = data[:labels].map { |l| l[:name].downcase }

    data[:complexity] = (labels && COMPLEXITY).first.to_sym

    data
  end

  def update_from_github
    remote_data =
      Octokit.issue("#{repository.user.username}/#{repository.name}", number)

    is_rubynoob = remote_data[:labels].map{ |l| l[:name] }.include?('RubyNoob')

    if is_rubynoob
      destroy
      return nil
    end

    update(
      name: remote_data[:title],
      description: remote_data[:body],
      closed: Issue.closed?(remote_data[:state])
    )
  end

  def self.closed?(state)
    state == 'close' ? true : false
  end
end
