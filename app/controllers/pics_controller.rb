class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show, :upvote]
  before_action :admin_only, except: [:index, :show, :upvote]

  # GET /pics
  # GET /pics.json
  def index
    @pics = Pic.all
  end

  # GET /pics/1
  # GET /pics/1.json
  def show
  end

  # GET /pics/new
  def new
    @pic = current_user.pics.build
  end

  # GET /pics/1/edit
  def edit
  end

  # POST /pics
  # POST /pics.json
  def create
    @pic = current_user.pics.build(pic_params)

    respond_to do |format|
      if @pic.save
        format.html { redirect_to @pic }
        format.json { render :show, status: :created, location: @pic }
      else
        format.html { render :new }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pics/1
  # PATCH/PUT /pics/1.json
  def update
    respond_to do |format|
      if @pic.update(pic_params)
        format.html { redirect_to @pic }
        format.json { render :show, status: :ok, location: @pic }
      else
        format.html { render :edit }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pics/1
  # DELETE /pics/1.json
  def destroy
    @pic.destroy
    respond_to do |format|
      format.html { redirect_to pics_url }
      format.json { head :no_content }
    end
  end

  def upvote
    @pic.upvote_by current_user
    redirect_back(fallback_location: @pic)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:title, :description, :user_id, :image)
    end

    def admin_only
      if current_user.email != "lusersks@gmail.com"
        redirect_to pics_url
      end
    end
end
