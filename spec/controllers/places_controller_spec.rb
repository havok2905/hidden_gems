require 'rails_helper'

RSpec.describe PlacesController, type: :controller do


  before do
    @places = [
      create(:place, name: 'foo', description: 'faz', lat: 0.5, lon: 0.6, city: 'city_a', street: 'street_a', zip: 'zip_a', state: 'state_a', website: 'http://google.com', cover: 'foo.png'),
      create(:place, name: 'bar', description: 'baz', lat: 0.7, lon: 0.8, city: 'city_b', street: 'street_b', zip: 'zip_b', state: 'state_b', website: 'http://twitter.com', cover: 'bar.png')
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
      a_result = ComparePlace.compare_hash_instance @result['places'][0], @places[0]
      b_result = ComparePlace.compare_hash_instance @result['places'][1], @places[1]

      expect(a_result).to eq true
      expect(a_result).to eq true
    end
  end


  describe 'by_tags' do
    before do
      @place = Place.first
      @place.tags = [ create(:tag, name: 'foo'), create(:tag, name: 'bar') ]
      @place.save

      get :by_tag_names, tags: 'foo,bar'
      @result = JSON.parse response.body
    end

    it 'should bring up the place for that tag' do
      expect(@result['places'].size).to eq 1

      a_result = ComparePlace.compare_hash_instance @result['places'][0], @place
      expect(a_result).to eq true
    end
  end


  describe 'by_tag_names' do
    before do
      @place = Place.first
      @place.tags = [ create(:tag) ]
      @place.save

      get :by_tags, tags: '1'
      @result = JSON.parse response.body
    end

    it 'should bring up the place for that tag' do
      expect(@result['places'].size).to eq 1

      a_result = ComparePlace.compare_hash_instance @result['places'][0], @place
      expect(a_result).to eq true
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

      result_a = CompareTag.compare_hash_instance result['place']['tags'][0], @tag
      expect(result_a).to eq true
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
      a_result = ComparePlace.compare_hash_instance @result['place'], @places[1]
      expect(a_result).to eq true
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

      a_result = ComparePlace.compare_hash_hash result['place'], @place_params
      expect(a_result).to eq true
    end

    it 'should fail without a secret' do
      post :create, @unauthorized_params
      result = JSON.parse response.body

      expect(result['message']).to eq 'unauthorized'
    end
  end


  describe 'update' do
    before do
      @place_params = { name: 'rat', description: 'raz', lat: 1.1, lon: 1.2, city: 'city_c', street: 'street_c', zip: 'zip_c', state: 'state_c', website: 'http://www.facebook.com', cover: 'rat.png' }
      @authorized_params = { id: 2, place: @place_params, secret: ENV['ADMIN_SECRET'] }
      @unauthorized_params = { id: 2, place: @place_params }
    end

    it 'should return updated the place with the correct params' do
      post :update, @authorized_params
      result = JSON.parse response.body

      a_result = ComparePlace.compare_hash_hash result['place'], @place_params
      expect(a_result).to eq true
    end

    it 'should update the place with the correct params' do
      post :update, @authorized_params

      place = Place.find 2
      a_result = ComparePlace.compare_hash_instance @place_params, place
      expect(a_result).to eq true
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

      a_result = ComparePlace.compare_hash_instance result['place'], @place
      expect(a_result).to eq true
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
