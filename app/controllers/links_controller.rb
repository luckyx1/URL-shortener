class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
    #this allows for the special redirect
    #basicly, find the url accosited with the has, and redirect!
    @li = Link.find_by_shorturl(params[:id])
    redirect_to @li.url
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    
    respond_to do |format|
      if @link.save
        format.html { redirect_to links_path, notice: 'Link was successfully created.' }
        format.json { render action: 'index', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    begin
      @link.destroy
    rescue
      @link = Link.find_by_shorturl(params[:id])
      @link.destroy
    end
    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  private
    def set_link
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url, :shorturl)
    end
end
