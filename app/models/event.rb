class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :admin, class_name: 'User'
    has_one_attached :avatar

    validates :start_date,
        presence: true
        validate :not_in_past

    validates :duration,
        presence: true
        numericality: { only_integer: true, greater_than: 0 }
        validate :mustiple_of_5

    validates :title,
        presence: true,
        length: {minimum: 5, maximum:140}

    validates :description,
        presence: true,
        length: {minimum: 20, maximum:1000}

    validates :price,
        presence: true,
        numericality: {minimum: 1, maximum: 1000}

    validates :location,
        presence: true

    def not_in_past
        if start_date != nil
            if Time.now > start_date
                errore.add(:start_date, "La date de votre événement est dépassée !")
            end
        end
    end

    def mustiple_of_5
        if duration != nil
            if duration % 5 != 0
                errors.add(:duration, "La durée doit être un multiple de 5")
            end
        end
    end
end