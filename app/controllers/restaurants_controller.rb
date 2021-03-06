class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "wlw", password: "wlwlunch", only: [:edit, :destroy]
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    opening(@restaurant)
    if params[:search].present?
      @restaurants = Restaurant.near(params[:search], 50, :order => :distance)
    else
      @restaurants = Restaurant.all
    end
    if params[:search]
      @restaurants = Restaurant.where("name LIKE :search OR website LIKE :search OR comments LIKE :search", search: "%#{params[:search]}%").order("created_at DESC")
    else
      @restaurants = Restaurant.all.order('created_at DESC')
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    opening(@restaurant)
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    opening(@restaurant)
  end

  # GET /restaurants/1/edit
  def edit
    opening(@restaurant)
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    opening(@restaurant)
    @restaurant = Restaurant.new(restaurant_params)
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    opening(@restaurant)
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def redirect_to_random
    @restaurant = Restaurant.offset(rand(Restaurant.count)).first
    render 'show'
  end

  def redirect_to_random_vegan
    @restaurant = Restaurant.where(vegan: true).sample
    render 'show'
  end

   def opening(restaurant)
     @opening = params[:opening] || []
   end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :website, :image, :location, :latitude, :longitude, :vegan, :comments, :opening => [])
    end
end




      
