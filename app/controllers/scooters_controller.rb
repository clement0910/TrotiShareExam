class ScootersController < ApplicationController
  before_action :set_user, only: [:create, :show]
  before_action :set_scooter, only: [:show, :edit, :update]

  def index
    @scooters = Scooter.all
  end

  def new
    @scooter = Scooter.new
  end

  def create
    @scooter = Scooter.new(params_scooter)
    @scooter.user_id = @user.id
    if @scooter.save
      redirect_to scooter_path(@scooter), notice: 'Trotinette créée'
    else
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    @scooter.update(params_scooter)
    if @scooter.save
      redirect_to scooter_path(@scooter), notice: 'Trotinette modifié'
    else
      render :new
    end
  end
  private

  def set_user
    @user = current_user
  end

  def set_scooter
    @scooter = Scooter.find(params[:id])
  end

  def params_scooter
    params.require(:scooter).permit(:marque)
  end
end
