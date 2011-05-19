class Rdv < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :adresse
  
end
