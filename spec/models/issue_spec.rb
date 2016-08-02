require 'rails_helper'

describe Issue, type: :model do
  it { should belong_to :repository }
end
