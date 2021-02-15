class AttendanceMailer < ApplicationMailer
    default from: 'yolo@yopmail.com'

    def guest_email(attendance)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @attendance = attendance
      @user = User.find(@attendance.user_id)
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://thp-event-bright-kegre.herokuapp.com/login'
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Participation confirmée !')
    end
end
