class ClassificationsController < ApplicationController
  before_action :set_classification, only: %i[ show edit update destroy ]

  # GET /classifications or /classifications.json
  def index
    @classifications = Classification.all
  end

  # GET /classifications/1 or /classifications/1.json
  def show
  end

  # GET /classifications/new
  def new
    @classification = Classification.new
  end

  # GET /classifications/1/edit
  def edit
  end

  # POST /classifications or /classifications.json
  def create
    @classification = Classification.new(classification_params)

    respond_to do |format|
      if @classification.save
        format.html { redirect_to classification_url(@classification), notice: "Classification was successfully created." }
        format.json { render :show, status: :created, location: @classification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classifications/1 or /classifications/1.json
  def update
    respond_to do |format|
      if @classification.update(classification_params)
        format.html { redirect_to classification_url(@classification), notice: "Classification was successfully updated." }
        format.json { render :show, status: :ok, location: @classification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifications/1 or /classifications/1.json
  def destroy
    @classification.destroy

    respond_to do |format|
      format.html { redirect_to classifications_url, notice: "Classification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification
      @classification = Classification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def classification_params
      params.require(:classification).permit(:classification_name)
    end
end
