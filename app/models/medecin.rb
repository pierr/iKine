class Medecin < ActiveRecord::Base
  
  belongs_to :adresse
  belongs_to :civilite
  
  has_many :patients
  has_many :ordonnances
  
end
