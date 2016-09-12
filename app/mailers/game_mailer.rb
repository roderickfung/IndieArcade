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

  # def notify_game_owner(answer)
  #   @question_owner = answer.question.user
  #
  #   if question_owner
  #     mail(to: question_owner.email.com, subject: "You got a new answer to your question")
  #   end
  # end

end
