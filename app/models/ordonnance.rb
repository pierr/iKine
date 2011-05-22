class Ordonnance < ActiveRecord::Base
  attr_accessible :numero,
                  :pathologie,
                  :date,
                  :prise_en_charge,
                  :type_prise_en_charge,
                  :paye,
                  :nombre_seances,
                  :bilan,
                  :caisse,
                  :mutuelle,
  belongs_to :patient
  belongs_to :medecin
  has_many :seances
  
end
