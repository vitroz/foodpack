class ProteinsController < ApplicationController
  before_action :set_protein, only: %i[ show edit update destroy ]

  # GET /proteins or /proteins.json
  def index
    @proteins = Protein.all
  end

  # GET /proteins/1 or /proteins/1.json
  def show
  end

  # GET /proteins/new
  def new
    @protein = Protein.new
  end

  # GET /proteins/1/edit
  def edit
  end

  # POST /proteins or /proteins.json
  def create
    @protein = Protein.new(protein_params)

    respond_to do |format|
      if @protein.save
        format.html { redirect_to protein_url(@protein), notice: "Protein was successfully created." }
        format.json { render :show, status: :created, location: @protein }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @protein.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proteins/1 or /proteins/1.json
  def update
    respond_to do |format|
      if @protein.update(protein_params)
        format.html { redirect_to protein_url(@protein), notice: "Protein was successfully updated." }
        format.json { render :show, status: :ok, location: @protein }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @protein.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proteins/1 or /proteins/1.json
  def destroy
    @protein.destroy!

    respond_to do |format|
      format.html { redirect_to proteins_url, notice: "Protein was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_protein
      @protein = Protein.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def protein_params
      params.require(:protein).permit(:name)
    end
end
