class ServidorsController < ApplicationController
  before_action :set_servidor, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
    
  # GET /servidors or /servidors.json
  def index
    @servidors = Servidor.all
  end

  # GET /servidors/1 or /servidors/1.json
  def show
  end

  # GET /servidors/new
  def new
    @servidor = Servidor.new
  end

  # GET /servidors/1/edit
  def edit
  end

  # POST /servidors or /servidors.json
  def create
    @servidor = Servidor.new(servidor_params)

    respond_to do |format|
      if @servidor.save
        format.html { redirect_to servidor_url(@servidor), notice: "Servidor was successfully created." }
        format.json { render :show, status: :created, location: @servidor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servidors/1 or /servidors/1.json
  def update
    respond_to do |format|
      if @servidor.update(servidor_params)
        format.html { redirect_to servidor_url(@servidor), notice: "Servidor was successfully updated." }
        format.json { render :show, status: :ok, location: @servidor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servidors/1 or /servidors/1.json
  def destroy
    @servidor.destroy!

    respond_to do |format|
      format.html { redirect_to servidors_url, notice: "Servidor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servidor
      @servidor = Servidor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def servidor_params
      params.require(:servidor).permit(:nome, :tipo)
    end
end
