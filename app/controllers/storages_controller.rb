class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  def my_storages
    @storages = current_user.storages
  end

  def index
    if params[:query]
      @storages = Storage.where(location: params[:query])

    else
      @storages = Storage.all
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def strong_params
  end

  def set_storage
  end
end
