class OurServicesController < ApplicationController
  before_action :set_our_service, only: [:show, :edit, :update, :destroy]

  # GET /our_services
  # GET /our_services.json
  def index
    @our_services = OurService.all
  end

  # GET /our_services/1
  # GET /our_services/1.json
  def show
  end

  # GET /our_services/new
  def new
    @our_service = OurService.new
  end

  # GET /our_services/1/edit
  def edit
  end

  # POST /our_services
  # POST /our_services.json
  def create
    @our_service = OurService.new(our_service_params)

    respond_to do |format|
      if @our_service.save
        format.html { redirect_to @our_service, notice: 'Our service was successfully created.' }
        format.json { render :show, status: :created, location: @our_service }
      else
        format.html { render :new }
        format.json { render json: @our_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /our_services/1
  # PATCH/PUT /our_services/1.json
  def update
    respond_to do |format|
      if @our_service.update(our_service_params)
        format.html { redirect_to @our_service, notice: 'Our service was successfully updated.' }
        format.json { render :show, status: :ok, location: @our_service }
      else
        format.html { render :edit }
        format.json { render json: @our_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /our_services/1
  # DELETE /our_services/1.json
  def destroy
    @our_service.destroy
    respond_to do |format|
      format.html { redirect_to our_services_url, notice: 'Our service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_our_service
      @our_service = OurService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def our_service_params
      params.fetch(:our_service, {})
    end
end
