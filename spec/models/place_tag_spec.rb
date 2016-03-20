# == Schema Information
#
# Table name: place_tags
#
#  id         :integer          not null, primary key
#  place_id   :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe PlaceTag, type: :model do

  describe 'associations' do
    it { should belong_to(:tag) }
    it { should belong_to(:place) }
  end

end
