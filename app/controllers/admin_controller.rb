class AdminController < ApplicationController
  before_action :authenticate_user! 

  def index
  end

  def new
    @entry = Entry.new
  end

  def create
  end
end
