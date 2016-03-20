class TagsController < ApplicationController
  def index
    render json: tags
  end

  def show
    render json: tag
  end

  def create
    render json: new_tag
  end

  def update
    render json: update_tag
  end

  def destroy
    render json: destroy_tag
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def tags
    Tag.all
  end

  def tag
    actions = %w(show update destroy)
    current_action = params[:action]
    actions.include?(current_action) && Tag.find(params[:id])
  end

  def new_tag
    Tag.create tag_params
  end

  def update_tag
    tag.update_attributes tag_params
    tag
  end

  def destroy_tag
    tag.destroy
  end
end
