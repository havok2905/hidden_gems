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
      result_a = CompareTag.compare_hash_instance @result['tags'][0], @tags[0]
      result_b = CompareTag.compare_hash_instance @result['tags'][1], @tags[1]

      expect(result_a).to eq true
      expect(result_b).to eq true
    end
  end

  describe 'show' do
    before do
      get :show, id: 2
      @result = JSON.parse response.body
    end

    it 'should load the correct tag' do
      result_a = CompareTag.compare_hash_instance @result['tag'], @tags[1]
      expect(result_a).to eq true
    end
  end

  describe 'create' do
    before do
      @tag_params = { name: 'foo' }
      @authorized_params = { tag: @tag_params, secret: ENV['ADMIN_SECRET'] }
      @unauthorized_params = { tag: @tag_params }
    end

    it 'should have created a new tag' do
      post :create, @authorized_params
      expect(Tag.count).to eq(@tags.size + 1)
    end

    it 'should have created a new tag with the correct params' do
      post :create, @authorized_params
      result = JSON.parse response.body
      result_a = CompareTag.compare_hash_hash result['tag'], @tag_params
      expect(result_a).to eq true
    end

    it 'should fail without a secret' do
      post :create, @unauthorized_params
      result = JSON.parse response.body
      expect(result['message']).to eq 'unauthorized'
    end
  end

  describe 'update' do
    before do
      @tag_params = { name: 'rat' }
      @authorized_params = { id: 2, tag: @tag_params, secret: ENV['ADMIN_SECRET'] }
      @unauthorized_params = { id: 2, tag: @tag_params }
    end

    it 'should return updated the tag with the correct params' do
      post :update, @authorized_params
      result = JSON.parse response.body
      result_a = CompareTag.compare_hash_hash result['tag'], @tag_params
      expect(result_a).to eq true
    end

    it 'should update the tag with the correct params' do
      post :update, @authorized_params
      tag = Tag.find 2
      result_a = CompareTag.compare_hash_instance @tag_params, tag
      expect(result_a).to eq true
    end

    it 'should fail without a secret' do
      post :update, @unauthorized_params
      result = JSON.parse response.body
      expect(result['message']).to eq 'unauthorized'
    end
  end

  describe 'destroy' do
    before do
      @tag = Tag.find(2)
      @authorized_params = { id: 2, secret: ENV['ADMIN_SECRET'] }
      @unauthorized_params = { id: 2 }
    end

    it 'should return the destroyed tag' do
      post :destroy, @authorized_params
      result = JSON.parse response.body
      result_a = CompareTag.compare_hash_instance result['tag'], @tag
      expect(result_a).to eq true
    end

    it 'should remove the tag' do
      post :destroy, @authorized_params
      expect(Tag.count).to eq 1
    end

    it 'should fail without a secret' do
      post :destroy, @unauthorized_params
      result = JSON.parse response.body
      expect(result['message']).to eq 'unauthorized'
    end
  end
end
