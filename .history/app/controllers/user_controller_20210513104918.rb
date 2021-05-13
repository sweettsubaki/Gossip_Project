class UserController < ApplicationController
  def show
    @id = params[:id]
  end

  def new
    @id = User.new
end

  def create
    @id = User.new  User.new(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], description: params['description'], password: params['password'], city_id: 1, age: params[:age])
