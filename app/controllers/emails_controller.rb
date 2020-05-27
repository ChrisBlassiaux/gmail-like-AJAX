# require 'faker'

class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def new
    puts "#" * 150
  end

  def create
    @email = Email.create(object: 'test', 
                       body: 'test')

    redirect_to '/'
  end
end

# Faker::TvShows::StrangerThings.character
# Faker::TvShows::StrangerThings.quote