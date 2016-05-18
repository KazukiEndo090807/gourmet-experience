class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @posted_restaurants = user.restaurants.order("created_at DESC")
  end


  def friends #友達一覧表示機能
    my_friends_i_am_sender_ids = Friend.where(status: 1).where(sender_id: current_user.id).pluck(:receiver_id)
    my_friends_i_am_receiver_ids = Friend.where(status: 1).where(receiver_id: current_user.id).pluck(:sender_id)
    my_friends_ids = my_friends_i_am_sender_ids.concat(my_friends_i_am_receiver_ids)

    @my_friends =[]

    my_friends_ids.each do |id|
      @my_friends << User.find(id)
    end
    return @my_friends

  end

  def favorite #ブックマーキング機能
    @favorite = Favorite.create(restaurant_id: favorite_restaurant_params[:restaurant_id], user_id: favorite_restaurant_params[:user_id])
  end

  def bookmark #ブックマーク一覧表示機能
    favorite_restaurants_ids = Favorite.where(user_id: "#{current_user.id}").pluck(:restaurant_id) #現在ログイン中のユーザIDに対応するレストランIDが配列として取得される。
    @favorite_restaurants = []

    favorite_restaurants_ids.each do |id|
      @favorite_restaurants << Restaurant.find(id)
    end #favorite_restaurants_ids.each do

    return @favorite_restaurants
  end

  def announce
    @friend = Friend.new
    @friends = Friend.all

    friends_sender_ids = Friend.where(status: "0").where(receiver_id: "#{current_user.id}").pluck(:sender_id)
    @friends_senders = []

      friends_sender_ids.each do |id|
        @friends_senders << User.find(id)
      end #friends_sender_ids.each....

      return @friends_senders
  end #announce



  def friend_accept #友達承認機能 --->>> Applicationコントローラ
    friend = Friend.where(status: 0).where(receiver_id: friend_accept_params[:receiver_id]).where(sender_id: friend_accept_params[:sender_id])
    friend.update(status: 1)
    redirect_to "/user/#{current_user.id}/announce"
  end


  #def favorite
    #@favorite_restaurants = Favorite.create(restaurant_id: , user_id: current_user.id)

    #@favorite_restaurants = Restaurant.where(user_id: current_user.id).where(id: )
  #end
def favorite_restaurant_params
    params.permit(:restaurant_id, :user_id)
  end

def friend_offer_params
  params.permit(:sender_id, :receiver_id)

end

def friend_accept_params
  params.require(:friend).permit(:receiver_id, :sender_id)
end




end


