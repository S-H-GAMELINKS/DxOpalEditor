class Api::SourcesController < ApplicationController
    before_action :set_source, only: [:show, :edit, :hashtags, :update, :destroy]

    # GET /api/sources
    # GET /api/sources.json
    def index
      @sources = Source.all
      render json: @sources
    end

    # GET /api/sources/1
    # GET /api/sources/1.json
    def show
      render json: @source
    end
  
    # GET /api/sources/new
    def new
      @source = Source.new
      render json: @source
    end
  
    # GET /api/sources/1/edit
    def edit
      render json: @source
    end
  
    # POST /api/sources
    # POST /api/sources.json
    def create
      @source = Source.new(source_params)
      
      if @source.save
        render json: @source
      else
        render json: @source.errors
      end
    end
  
    # PATCH/PUT /api/sources/1
    # PATCH/PUT /api/sources/1.json
    def update
      if @source.update(source_params)
        render json: @source
      else
        render json: @source.errors
      end
    end
  
    # DELETE /api/sources/1
    # DELETE /api/sources/1.json
    def destroy
      render json: @source.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_source
        @source = Source.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def source_params
        params.require(:source).permit(:name, :code)
      end
end