module NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Post"
      "フォローしている#{notification.notifiable.user.name}さんが投稿しました"
    else
      "あなた投稿が#{notification.notifiable.user.name}さんにいいねされました"
    end
  end
end