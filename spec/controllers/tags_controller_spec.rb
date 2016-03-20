require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  before do
    @tags = [
      create(:tag, name: 'foo'),
      create(:tag, name: 'bar')
    ]
  end

  describe 'index' do
    before do
      get :index
      @result = JSON.parse response.body
    end

    it 'should display all tags' do
      expect(@result['tags'].size).to eq 2
    end

    it 'should load the correct tags' do
      expect(@result['tags'][0]['name']).to eq @tags[0].name
      expect(@result['tags'][1]['name']).to eq @tags[1].name
    end
  end

  describe 'show' do
    before do
      get :show, id: 2
      @result = JSON.parse response.body
    end

    it 'should load the correct tag' do
      expect(@result['tag']['name']).to eq @tags[1].name
    end
  end

  describe 'create' do
    before do
      @tag_params = { name: 'foo' }
      post :create, tag: @tag_params
      @result = JSON.parse response.body
    end

    it 'should have created a new tag' do
      expect(Tag.count).to eq(@tags.size + 1)
    end

    it 'should have created a new tag with the correct params' do
      expect(@result['tag']['name']).to eq @tag_params[:name]
    end
  end

  describe 'update' do
    before do
      @tag_params = { name: 'rat' }
      post :update, id: 2, tag: @tag_params
      @result = JSON.parse response.body
    end

    it 'should return updated the tag with the correct params' do
      expect(@result['tag']['name']).to eq @tag_params[:name]
    end

    it 'should update the tag with the correct params' do
      tag = Tag.find 2
      expect(tag.name).to eq @tag_params[:name]
    end
  end

  describe 'destroy' do
    before do
      @tag = Tag.find(2)
      post :destroy, id: 2
      @result = JSON.parse response.body
    end

    it 'should return the destroyed tag' do
      expect(@result['tag']['name']).to eq @tag.name
    end

    it 'should remove the tag' do
      expect(Tag.count).to eq 1
    end
  end
end
