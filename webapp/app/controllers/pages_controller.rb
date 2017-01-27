class PagesController < ApplicationController
  def welcome
    render json: {message: 'hello!'}, status: 200
  end
end
