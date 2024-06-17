class User::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: 'ゲストユーザーとしてログインしました。'
  end
  
end
