class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end


  def create
    @email = Email.create!(object: Faker::TvShows::StrangerThings.character, 
                       body: Faker::TvShows::StrangerThings.quote,
                       read: false
                      )

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { 
        redirect_to email_path(@email.id) 
      }
      format.js { }
    end

    @email.update(read: true)
  end

  def update
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { 
        redirect_to root_path
      }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    if @email.destroy
      respond_to do |format|
        format.html { 
          redirect_to root_path
        }
        format.js { }
      end
    end
  end
end