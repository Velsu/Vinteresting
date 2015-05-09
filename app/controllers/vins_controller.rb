class VinsController < ApplicationController
  before_action :set_vin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  respond_to :html

  def index
    @vins = Vin.all.order("created_at DESC").paginate(page: params[:page], per_page: 15)
    respond_with(@vins)
  end

  def show
    respond_with(@vin)
  end

  def new
    @vin = current_user.vins.build
    respond_with(@vin)
  end

  def edit
  end

  def create
    @vin = current_user.vins.build(vin_params)
    if @vin.save
      redirect_to @vin, notice: "Vin successfully created"
    else
      render action: 'new'
    end
  end

  def update
    @vin.update(vin_params)
    respond_with(@vin)
  end

  def destroy
    @vin.destroy
    respond_with(@vin)
  end

  def upvote
    @vin = Vin.find(params[:id])
    @vin.upvote_by current_user
    redirect_to root_url
  end

  def downvote
    @vin = Vin.find(params[:id])
    @vin.downvote_from current_user
    redirect_to root_url
  end

  private
    def set_vin
      @vin = Vin.find(params[:id])
    end

    def correct_user
      @vin = current_user.vins.find_by(id: params[:id])
      redirect_to vins_path, 
      notice: "This area is restricted to the owner" if @vin.nil?
    end

    def vin_params
      params.require(:vin).permit(:description, :image)
    end
end
