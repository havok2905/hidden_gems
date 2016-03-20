# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  lat         :float
#  lon         :float
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Place < ActiveRecord::Base
  has_many :place_tags
  has_many :tags, -> { uniq }, through: :place_tags

  scope :by_tag_ids, ->(tags) { joins(:tags).where('tags.id IN (?)', tags).group('places.id').having('COUNT(tags.id)=' + tags.size.to_s).flatten }
end
