# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  lat         :float
#  lon         :float
#  description :string
#  name        :string
#  street      :string
#  city        :string
#  state       :string
#  zip         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cover       :string
#  website     :string
#

class Place < ActiveRecord::Base
  has_many :place_tags
  has_many :tags, -> { uniq }, through: :place_tags

  scope :by_tag_ids, ->(tags) { joins(:tags).where('tags.id IN (?)', tags).group('places.id').having('COUNT(tags.id)=' + tags.size.to_s).flatten }
  scope :by_tag_names, ->(tags) { joins(:tags).where('tags.name IN (?)', tags).group('places.id').having('COUNT(tags.name)=' + tags.size.to_s).flatten }
end
