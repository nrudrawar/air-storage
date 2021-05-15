class StorageSpacesController < ApplicationController
  before_action :find_storage_space, except: [:index, :new, :create, :my_spaces]

  def index
    @storage_spaces = StorageSpace.where.not(latitude: nil, longitude: nil)

    @markers = @storage_spaces.geocoded.map do |storage_space|
      {
        lat: storage_space.latitude,
        lng: storage_space.longitude,
        infoWindow: render_to_string(partial: "/storage_spaces/info_window", locals: { storage_space: storage_space })
      }
    end
  end

  def my_spaces
    @storage_spaces = current_user.storage_spaces
  end

  def show
  end

  def new
    @storage_space = StorageSpace.new
  end

  def create
    @storage_space = StorageSpace.new(storage_space_params)
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
    @storage_space = StorageSpace.find(params[:id])
  end

  def storage_space_params
    params.require(:storage_space).permit(:name, :area, :address, :city,
                  :post_code, :country, :description, :available, :base_price,
                  :status, photos: [])
  end
end
