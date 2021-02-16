class EventsController < ApplicationController
  class EventController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
      @event = Event.all
    end

    def new
      @event = Event.new
    end

    def crate
      @event = Event.new(params_event)
      @event.admin_id = current_user.id
      if @event.save
        redirect_to event_path(@event.id)
        flash[:success] = "Votre évenement a bien été crée !"
      else
        render new_event_path
      end
    end

    def show
      @event = Event.find(params[:id])
      @count = count
      @end_date = end_date
      @participated = participated?
    end

    def edit
    end

    def destroy
    end

    private

    # Récupérer les infos de la création d'event
    def params_event
      params.require(:event).permit(:start_date, :duration, :title, :price, :description, :location, :avatar)
    end

    # Récupérer le nombre d'user inscrit à l'event
    def count
      Event.find(params[:id]).users.all.count
    end

    # Calcul de la date de fin, if faut passer la duration en minutes
    def end_date
      minutes = Event.find(params[:id]).durateion * 60
      (Event.find(params[:id]).start_date + minutes).strftime('%d of %B, %Y - %HH%M')
    end

    # Définir si il y'a eu participation à l'event
    def participated?
      Event.find(params['id']).users.ids
    end

  end

end
