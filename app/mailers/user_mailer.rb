class UserMailer < ApplicationMailer
    default from: 'yolo@yopmail.com'

    def welcome_email(user)
      @user = user
      @url  = 'http://thp-event-bright-kegre.herokuapp.com/login'
      mail(to: @user.email, subject: 'Bienvenue chez nous !')
    end
end
