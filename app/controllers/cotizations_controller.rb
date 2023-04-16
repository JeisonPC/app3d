class CotizationsController < ApplicationController
  before_action :set_cotization, only: %i[ show edit update destroy ]

  # GET /cotizations
  def index
    @cotizations = Cotization.all
  end

  # GET /cotizations/1
  def show
  end

  # GET /cotizations/new
  def new
    @cotization = Cotization.new
  end

  # GET /cotizations/1/edit
  def edit
  end

  # POST /cotizations
  def create
    @cotization = Cotization.new(cotization_params)

    if @cotization.save
      redirect_to @cotization, notice: "Cotization was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cotizations/1
  def update
    if @cotization.update(cotization_params)
      redirect_to @cotization, notice: "Cotization was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cotizations/1
  def destroy
    @cotization.destroy
    redirect_to cotizations_url, notice: "Cotization was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cotization
      @cotization = Cotization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cotization_params
      params.require(:cotization).permit(:email, :file, :price)
    end
end
