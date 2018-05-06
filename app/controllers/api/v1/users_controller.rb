class Api::V1::UsersController < Api::V1::BaseController

  def create_user
    user = User.find_or_create_by(email: params[:email])
    if user.id.present?
      @success = true
    else
      @failed = false
    end
  end

  def find_friend_ship
    user = User.find_by(email:params[:email])
    if user.present?
      user_ids = FriendShip.where(user_id:user.id).pluck(:friend_id)
      @users = User.where(id:user_ids)
      if @users.present?
        @success = true
        @count = @users.size
      else
        @success = "He has no friends"
      end
    else
      @failed = "This email has no friends or you email is not correct"
    end
  end

  def find_friend_two_email
    return @failed = "Failed please confirm the JSON parameter is correct and whether the email format is correct" if params[:friends].size != 2
    user_one = User.find_by(email:params[:friends][0])
    user_two = User.find_by(email:params[:friends][1])
    if user_one.present? && user_two.present?
      user_one_ids = FriendShip.where(user_id:user_one.id).pluck(:friend_id)
      user_two_ids = FriendShip.where(user_id:user_two.id).pluck(:friend_id)
      user_ids = user_one_ids & user_two_ids
      if user_ids.present?
        @users = User.where(id:user_ids)
        @success = true
        @count = @users.size
      else
        @failed = "The two emails have no common friends"
      end
    else
      @failed = "The two emails have no common friends please confirm the JSON parameter is correct and is it two email?"
    end
  end

  def create_friend_ship
    if params[:friends].present? && params[:friends].size == 2
      user = User.find_or_create_by(email: params[:friends][0])
      friend_user = User.find_or_create_by(email: params[:friends][1])
      block_friend_ship = BlockFriendShip.where(user_id:user.id,block_id:friend_user.id)
      block_friend_ship_two = BlockFriendShip.where(user_id:friend_user.id,block_id:user.id)
      return @failed = "They are blocked can not be friends" if block_friend_ship.present? || block_friend_ship_two.present?
      return @failed = "Failed please confirm the JSON parameter is correct and whether the email format is correct" if user.id.blank? || friend_user.id.blank?
      if FriendShip.find_by(user_id:user.id,friend_id:friend_user.id).present?
        @success = "They are already friends"
      else
        friend_user_one = FriendShip.find_or_create_by(user_id:user.id,friend_id:friend_user.id)
        friend_user_two = FriendShip.find_or_create_by(user_id:friend_user.id,friend_id:user.id)
        @success = true
      end
    else
      @failed = "Failed please confirm the JSON parameter is correct and is it two email?"
    end
  end
  def create_subscribe_ship
    if params[:requestor].present? && params[:target].present?
      user = User.find_or_create_by(email: params[:requestor])
      subscribe_user = User.find_or_create_by(email: params[:target])
      return @failed = "Failed please confirm the JSON parameter is correct and whether the email format is correct" if user.id.blank? || subscribe_user.id.blank?
      if SubscribeShip.find_by(user_id:user.id,subscribe_id:subscribe_user.id).present?
        @success = "You are already subscribed"
      else
        subscribe_ship = SubscribeShip.find_or_create_by(user_id:user.id,subscribe_id:subscribe_user.id)
        @success = true
      end
    else
      @failed = "Failed please confirm the JSON parameter is correct and is it two email?"
    end
  end

  def block_subscribe_friend
    if params[:requestor].present? && params[:target].present?
      user = User.find_by(email: params[:requestor])
      subscribe_user = User.find_by(email: params[:target])
      return @failed = "Failed please confirm the JSON parameter is correct and whether the email format is correct" if user.id.blank? || subscribe_user.id.blank?
      subscribe_ship = SubscribeShip.find_by(user_id:user.id,subscribe_id:subscribe_user.id)
      friend_ship_one = FriendShip.find_by(user_id:user.id,friend_id:subscribe_user.id)
      friend_ship_two = FriendShip.find_by(user_id:subscribe_user,friend_id:user.id)
      block_friend_ship = BlockFriendShip.find_or_create_by(user_id:user.id,block_id:subscribe_user.id) if friend_ship_one.blank? && friend_ship_two.blank?
      subscribe_ship.try(:destroy)
      @success = true
    else
      @failed = "Failed please confirm the JSON parameter is correct and is it two email?"
    end
  end

  def find_friend_subscribe
    user = User.find_by(email:params[:sender])
    if user.present?
      friend_ids = FriendShip.where(user_id:user.id).pluck(:friend_id)
      subscribe_ids = SubscribeShip.where(subscribe_id:user.id).pluck(:user_id)
      ids = (friend_ids + subscribe_ids).uniq
      if @users.present?
        @users = User.where(id:ids)
        @success = true
        @count = @users.size
      else
        @success = "He has no friends and subscribers"
      end
    else
      @failed = "I'm sorry,no user please confirm the JSON parameter is correct"
    end
  end
end
