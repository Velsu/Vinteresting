class VinsController < ApplicationController
  before_action :set_vin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vins = Vin.all
    respond_with(@vins)
  end

  def show
    respond_with(@vin)
  end

  def new
    @vin = Vin.new
    respond_with(@vin)
  end

  def edit
  end

  def create
    @vin = Vin.new(vin_params)
    @vin.save
    respond_with(@vin)
  end

  def update
    @vin.update(vin_params)
    respond_with(@vin)
  end

  def destroy
    @vin.destroy
    respond_with(@vin)
  end

  private
    def set_vin
      @vin = Vin.find(params[:id])
    end

    def vin_params
      params.require(:vin).permit(:description)
    end
end
