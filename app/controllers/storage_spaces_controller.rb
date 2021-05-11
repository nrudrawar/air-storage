class StorageSpacesController < ApplicationController
  before_action :find_storage_space, except: [:index]

  def index
    @storage_spaces = Storage_space.all
  end

  def show
  end

  def new
    @storage_space = Storage_space.new
  end

  def create
    @storage_space = Storage_space.new(storage_space_params)
    @storage_space.user = current_user

    if @storage_space.save
      redirect_to @storage_space, notice: "Storage space was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @storage_space.update(storage_space_params)
    redirect_to @storage_space
  end

  def destroy
    @storage_space.update(status: "inactive")
    redirect_to storage_spaces_path, notice: "Successfully desactivated"
  end

  private

  def find_storage_space
    @storage_space = Storage_space.find(params[:id])
  end

  def storage_space_params
    params.require(:storage_space).permit(:name, :area, :address, :city,
                  :post_code, :country, :description, :available, :base_price,
                  :status, photos: [])
  end
end