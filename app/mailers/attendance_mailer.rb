class AttendanceMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'

    def guest_email(attendance)
      @attendance = attendance
      @attendance_user = User.find(@attendance.user_id)
      @attendance_event = @attendance.event
      @admin = User.find(@attendance.event.admin_id)
      @url  = 'http://thp-event-bright-kegre/login' # a utiliser dans la view
      mail(to: @admin.email, subject: 'Un utilisateur a rejoint l'évenement !')
    end
end
