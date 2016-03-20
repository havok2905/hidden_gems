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

require 'rails_helper'

RSpec.describe Place, type: :model do

  describe 'associations' do
    it { should have_many(:tags) }
    it { should have_many(:place_tags) }
  end

  describe 'scopes' do
    describe 'by_tag_ids' do
      before do
        # GENERATED PLACES WITH TAGS
        # a foo(1) bar(2)
        # b bar(2) bat(4)
        # c foo(1) baz(3)

        places = [
          create(:place, name: 'a'),
          create(:place, name: 'b'),
          create(:place, name: 'c')
        ]

        tags  = [
          create(:tag, name: 'foo'),
          create(:tag, name: 'bar'),
          create(:tag, name: 'baz'),
          create(:tag, name: 'bat')
        ]

        places[0].tags = [tags[0], tags[1]]
        places[1].tags = [tags[1], tags[3]]
        places[2].tags = [tags[0], tags[2]]

        places.each { |place| place.save }
      end

      it 'should find places with the specificed tag ids' do
        places_one_two = Place.by_tag_ids [1,2]
        places_two_four = Place.by_tag_ids [2,4]
        places_one_three = Place.by_tag_ids [1,3]
        places_one = Place.by_tag_ids [1]

        expect(places_one_two.first.name).to eq 'a'
        expect(places_one_two.count).to eq 1

        expect(places_two_four.first.name).to eq 'b'
        expect(places_two_four.size).to eq 1

        expect(places_one_three.first.name).to eq 'c'
        expect(places_one_three.size).to eq 1

        expect(places_one.size).to eq 2
        expect(places_one.first.name).to eq 'a'
        expect(places_one.last.name).to eq 'c'
      end
    end
  end

end
