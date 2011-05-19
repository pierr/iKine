class Civilite < ActiveRecord::Base
  
  has_many :patients
  has_many :medecins
  
end
