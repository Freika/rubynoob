require 'rails_helper'

describe Repository, type: :model do
  it { should belong_to :user }
end
