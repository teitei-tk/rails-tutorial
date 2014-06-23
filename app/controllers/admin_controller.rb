class AdminController < ApplicationController
  before_action :authenticate_user! 

  def index
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        flash.notice = "entry was successfully created."
        format.html { redirect_to :admin_new }
      else
        flash.alert = "save entry error."
        format.html { render :new }
      end
    end
  end


  private
    def entry_params
      params.require(:entry).permit(:title, :content)
    end
end
