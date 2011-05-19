class Ordonnance < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :medecin
  
  has_many :seances
  
end
