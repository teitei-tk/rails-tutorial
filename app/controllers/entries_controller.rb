class EntriesController < ApplicationController
  before_action :set_entry, only: [ :show, :detail ]

  def index
    @entries = Entry.all
  end

  def detail
  end

  def show
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
