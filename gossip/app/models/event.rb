class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User"
  
  

  validates :start_date, 
    presence: {message: "Merci de saisir une date !"}
  validate :is_in_future?

  validates :duration, 
    presence: {message: "Merci de saisir une durée !"}
  validate :divisible_by_five

  validates :title, 
    presence: {message: "Merci de saisir un titre !"},
    length: {minimum: 5, maximum: 140, message: "Le titre doit être entre 5 et 140 caractères"}
  validates :description, 
    presence: {message: "Merci de saisir un contenu !"},
    length: {minimum: 20, maximum: 1000, message: "La description doit être entre 20 et 1000 caractères"}
  validates :price,
    presence: {message: "Merci de saisir un prix !"},
    numericality: { in: 1..1000 }
  validates :location, 
    presence: {message: "Merci de saisir une ville !"}


  def divisible_by_five
    if duration % 5 != 0
			errors.add(:duration, "La durée doit être un multiple de 5")
		end
  end

  def is_in_future?
		if start_date.to_date < DateTime.now.to_date
			errors.add(:start_date, "Date dépassée")
		end
  end
end
