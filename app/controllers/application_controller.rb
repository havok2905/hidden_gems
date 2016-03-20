class ApplicationController < ActionController::API
  include ::ActionController::Serialization

  private

  def render_for_all(result)
    render status: 200, json: result
  end

  def render_for_admin(result)
    if admin?
      render status: 200, json: result
    else
      render status: 401, json: { message: 'unauthorized' }
    end
  end

  def admin?
    params[:secret] == ENV['ADMIN_SECRET']
  end
end
