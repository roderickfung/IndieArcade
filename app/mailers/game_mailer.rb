class GameMailer < ApplicationMailer
    def notify_game_owner(game, user, message_title, message, message_email)
        @message_title = message_title
        @message = message
        @message_email = message_email
        @game = game
        @user = user
        @owner = game.user
        if user
            mail to: owner.email.com, subject: "#{user} has inquired about #{game.title}."
        end
    end
end
