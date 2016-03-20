require 'rails_helper'

RSpec.describe PlacesController, type: :controller do

  before do
    @places = [
      create(:place, name: 'foo', description: 'faz', lat: 0.5, lon: 0.6),
      create(:place, name: 'bar', description: 'baz', lat: 0.7, lon: 0.8)
    ]
  end

  describe 'index' do
    before do
      get :index
      @result = JSON.parse response.body
    end

    it 'should display all places' do
      expect(@result['places'].size).to eq 2
    end

    it 'should load the correct places' do
      expect(@result['places'][0]['name']).to eq @places[0].name
      expect(@result['places'][0]['description']).to eq @places[0].description
      expect(@result['places'][0]['lat']).to eq @places[0].lat
      expect(@result['places'][0]['lon']).to eq @places[0].lon

      expect(@result['places'][1]['name']).to eq @places[1].name
      expect(@result['places'][1]['description']).to eq @places[1].description
      expect(@result['places'][1]['lat']).to eq @places[1].lat
      expect(@result['places'][1]['lon']).to eq @places[1].lon
    end
  end

  describe 'by_tags' do
    before do
      @place = Place.first
      @place.tags = [ create(:tag) ]
      @place.save

      get :by_tags, tags: '1'
      @result = JSON.parse response.body
    end

    it 'should bring up the place for that tag' do
      expect(@result['places'].size).to eq 1

      expect(@result['places'][0]['name']).to eq @place.name
      expect(@result['places'][0]['description']).to eq @place.description
      expect(@result['places'][0]['lat']).to eq @place.lat
      expect(@result['places'][0]['lon']).to eq @place.lon
    end
  end

  describe 'tag' do
    before do
      @place = create :place
      @tag = create :tag
      @authorized_params = { id: @place.id, tag_id: @tag.id, secret: ENV['ADMIN_SECRET'] }
      @unauthorized_params = { id: @place.id, tag_id: @tag.id }
    end

    it 'should add a tag to the place' do
      post :tag, @authorized_params

      place = Place.find @place.id
      expect(place.tags.size).to eq 1
    end

    it 'should return the place with the new tag' do
      post :tag, @authorized_params
      result = JSON.parse response.body

      expect(result['place']['tags'][0]['id']).to eq @tag.id
      expect(result['place']['tags'][0]['name']).to eq @tag.name
    end

    it 'should fail without a secret' do
      post :tag, @unauthorized_params
      result = JSON.parse response.body

      expect(result['message']).to eq 'unauthorized'
    end
  end

  describe 'show' do
    before do
      get :show, id: 2
      @result = JSON.parse response.body
    end

    it 'should load the correct place' do
      expect(@result['place']['name']).to eq @places[1].name
      expect(@result['place']['description']).to eq @places[1].description
      expect(@result['place']['lat']).to eq @places[1].lat
      expect(@result['place']['lon']).to eq @places[1].lon
    end
  end

  describe 'create' do
    before do
      @place_params = { name: 'rat', description: 'raz', lat: 1.1, lon: 1.2 }
      @authorized_params = { place: @place_params, secret: ENV['ADMIN_SECRET'] }
      @unauthorized_params = { place: @place_params }
    end

    it 'should have created a new place' do
      post :create, @authorized_params

      expect(Place.count).to eq(@places.size + 1)
    end

    it 'should have created a new place with the correct params' do
      post :create, @authorized_params
      result = JSON.parse response.body

      expect(result['place']['name']).to eq @place_params[:name]
      expect(result['place']['description']).to eq @place_params[:description]
      expect(result['place']['lat']).to eq @place_params[:lat]
      expect(result['place']['lon']).to eq @place_params[:lon]
    end

    it 'should fail without a secret' do
      post :create, @unauthorized_params
      result = JSON.parse response.body

      expect(result['message']).to eq 'unauthorized'
    end
  end

  describe 'update' do
    before do
      @place_params = { name: 'rat', description: 'raz', lat: 1.1, lon: 1.2 }
      @authorized_params = { id: 2, place: @place_params, secret: ENV['ADMIN_SECRET'] }
      @unauthorized_params = { id: 2, place: @place_params }
    end

    it 'should return updated the place with the correct params' do
      post :update, @authorized_params
      result = JSON.parse response.body

      expect(result['place']['name']).to eq @place_params[:name]
      expect(result['place']['description']).to eq @place_params[:description]
      expect(result['place']['lat']).to eq @place_params[:lat]
      expect(result['place']['lon']).to eq @place_params[:lon]
    end

    it 'should update the place with the correct params' do
      post :update, @authorized_params

      place = Place.find 2
      expect(place.name).to eq @place_params[:name]
      expect(place.description).to eq @place_params[:description]
      expect(place.lat).to eq @place_params[:lat]
      expect(place.lon).to eq @place_params[:lon]
    end

    it 'should fail without a secret' do
      post :update, @unauthorized_params
      result = JSON.parse response.body

      expect(result['message']).to eq 'unauthorized'
    end
  end

  describe 'destroy' do
    before do
      @place = Place.find(2)
      @authorized_params = { id: 2, secret: ENV['ADMIN_SECRET'] }
      @unauthorized_params = { id: 2 }
    end

    it 'should return the destroyed place' do
      post :destroy, @authorized_params
      result = JSON.parse response.body

      expect(result['place']['name']).to eq @place.name
      expect(result['place']['description']).to eq @place.description
      expect(result['place']['lat']).to eq @place.lat
      expect(result['place']['lon']).to eq @place.lon
    end

    it 'should remove the place' do
      post :destroy, @authorized_params
      result = JSON.parse response.body

      expect(Place.count).to eq 1
    end

    it 'should fail without a secret' do
      post :destroy, @unauthorized_params
      result = JSON.parse response.body

      expect(result['message']).to eq 'unauthorized'
    end
  end
end
