class GourmetsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
  end

  def restaurants
    @restaurants = Restaurant.includes(:user).order("created_at DESC")
  end

  def new
  end

  def new_restaurant
    @restaurant = Restaurant.new
  end

  def create
    Restaurant.create(r_name: restaurant_params[:r_name], image: restaurant_params[:image], place:restaurant_params[:place], food:restaurant_params[:food], price: restaurant_params[:price], review: restaurant_params[:review], user_id: current_user.id)
  end



  def destroy #投稿削除機能
    restaurant = Restaurant.find(params[:id])
    if restaurant.user_id == current_user.id
      restaurant.destroy
    end
  end

  def edit #投稿編集機能
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    restaurant = Restaurant.find(params[:id])
    if restaurant.user_id == current_user.id
      restaurant.update(restaurant_params)
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comments = @restaurant.comments.includes(:user)
    @favorites = Favorite.all
  end

  def registered_users  #登録ユーザ一覧表示
    @users = User.all
    @friends = Friend.all
    @friend = Friend.new
  end

  def friend_offer #友達申請機能（「申請」ボタンがクリックされると呼び出される。）
    @friend = Friend.create(sender_id: friend_offer_params[:sender_id], receiver_id: friend_offer_params[:receiver_id], status: 0)
    redirect_to "/gourmet_info/registered_users"
  end



  private
  def restaurant_params
    params.require(:restaurant).permit(:r_name, :image, :place, :food, :price, :review)
  end

  def friend_offer_params
    params.require(:friend).permit(:receiver_id, :sender_id)
  end


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
