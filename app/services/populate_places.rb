class PopulatePlaces
  class << self

    def populate
      json_data.each do |place|
        add_new_data place
      end
    end

    private

    def json_data
      path = Rails.root.join 'places.json'
      @data ||= JSON.parse File.read(path)
    end

    def add_new_data(place)
      tags = add_new_tags place['tags']
      add_new_place place, tags
    end

    def add_new_tags(tags)
      tags.map do |tag|
        Tag.find_or_create_by(name: tag['name'])
      end
    end

    def add_new_place(place, tags)
      Place.find_or_create_by(name: place['name']) do |p|
        p.lat = place['lat']
        p.lon = place['lon']
        p.description = place['description']
        p.name = place['name']
        p.street = place['street']
        p.city = place['city']
        p.state = place['state']
        p.zip = place['zip']
        p.tags = tags
      end
    end

  end
end
