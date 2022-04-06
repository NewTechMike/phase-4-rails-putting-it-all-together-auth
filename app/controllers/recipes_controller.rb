class RecipesController < ApplicationController
before_action :authorize
#skip_before_action :authorize, only: :index
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid_response
  def index
   # user = User.find_by(id: session[:user_id])
    #render json: { error: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
    recipes = Recipe.all 
    render json: recipes
  end 

  def create   
    user = User.find_by(id: session[:user_id])
    #return render json: { error: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
    recipe = user.recipes.create!(recipes_params)
    render json: recipe, status: :created 
  end 

  private
  
  def recipes_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end 

 # def authorize
  #  return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  #end 
  def render_record_invalid_response(event)
    return render json: { errors: event.record.errors.full_messages }, status: :unprocessable_entity
  end 

end
