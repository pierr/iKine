class Adresse < ActiveRecord::Base
  
  belongs_to :ville
  
  has_many :patients # si si, ptet que des gens habitent dans la même maison...
  has_many :medecins
  has_many :rdvs
  
end
