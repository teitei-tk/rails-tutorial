class EntriesController < ApplicationController
  before_action :set_entry, only: [ :show, :detail ]
  before_action :get_entries, only: [ :get_by_cond ]

  def index
    @entries = Entry.all
  end

  def get_by_cond
  end

  def detail
  end

  def show
  end

  private
    PER_LIMIT = 10

    def get_entries
      limit  = @PER_LIMIT
      offset = 0
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
