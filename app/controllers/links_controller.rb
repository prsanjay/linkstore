class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /links
  # GET /links.json
  def index
    if params[:tag].present?
      @links = current_user.links.tagged_with(params[:tag]).order('created_at DESC').page(params[:page])
    elsif params[:search].present?
      @links = current_user.links.search(params[:search]).order('created_at DESC').page(params[:page])
    else
      @links = current_user.links.all.order('created_at DESC').page(params[:page])
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @user = current_user
    @link = @user.links.build
  end

  # GET /links/1/edit
  def edit
    @tag_list = @link.tag_list
  end

  # POST /links
  # POST /links.json
  def create
    @user = current_user
    @link = @user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:link_name, :subject, :description, :url, :url_content,:tag_list)
    end
end
