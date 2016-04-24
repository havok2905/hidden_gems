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

FactoryGirl.define do
  factory :place do
    name 'Coffeehaus'
    description 'small, casual, and simple coffee shop'
    lat 28.6585257
    lon -81.182116
    street '1016 Lockwood Blvd'
    city 'Oviedo'
    state 'FL'
    zip '32765'
    website 'http://www.yelp.com/biz/barnies-coffee-oviedo'
    cover 'coffeehaus.png'
  end
end
