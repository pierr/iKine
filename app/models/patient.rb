class Patient < ActiveRecord::Base
  
  belongs_to :civilite
  belongs_to :adresse
  belongs_to :medecin
  
  has_many :ordonnances
  has_many :rdvs
  
  
  validates :nom, :presence =>true
  
end
