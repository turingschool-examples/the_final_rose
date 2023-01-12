require 'rails_helper'

RSpec.describe OutingContestant, type: :model do
  describe 'relationships' do
    it {belongs_to :contestant}
    it {belongs_to :outing}
  end
end