class PlacesController < ApplicationController
  def index
    render json: places
  end

  def show
    render json: place
  end

  def create
    render json: new_place
  end

  def update
    render json: update_place
  end

  def destroy
    render json: destroy_place
  end

  def by_tags
    render json: places_by_tags
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :lat, :lon)
  end

  def places
    Place.all
  end

  def places_by_tags
    tags = params[:tags].split(',')
    Place.by_tag_ids tags
  end

  def place
    actions = %w(show update destroy)
    current_action = params[:action]
    actions.include?(current_action) && Place.find(params[:id])
  end

  def new_place
    Place.create place_params
  end

  def update_place
    place.update_attributes place_params
    place
  end

  def destroy_place
    place.destroy
  end
end
