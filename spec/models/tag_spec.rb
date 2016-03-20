# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe 'associations' do
    it { should have_many(:places) }
    it { should have_many(:place_tags) }
  end

end
