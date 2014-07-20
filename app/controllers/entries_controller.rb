class EntriesController < ApplicationController
  before_action :set_entry, only: [ :show, :detail ]
  before_action :get_entries, only: [ :entry_by_cond ]

  def index
    @entries = Entry.all
  end

  def entry_by_cond
  end

  def detail
  end

  def show
  end

  private
    def get_entries
      limit  = 10
      offset = 10
      params.include? 'limit'
        limit = params[:limit]
      params.include? 'offset'
        offset = params[:offset]

      @entries = Entry.limit(limit).offset(offset)
    end

    def set_entry
      @entry = Entry.find(params[:id])
    end
end
