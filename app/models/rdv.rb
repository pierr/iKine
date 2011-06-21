# == Schema Information
# Schema version: 20110616110935
#
# Table name: rdvs
#
#  id              :integer         not null, primary key
#  date            :datetime
#  duree           :integer
#  a_domicile      :boolean
#  nouveau_patient :boolean
#  telephone       :string(255)
#  email           :string(255)
#  commentaire     :string(255)
#  patient_id      :integer
#  adresse_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Rdv < ActiveRecord::Base
    attr_accessible :date,
                    :lieu,
                    :contact,
                    :ordonnance_token
    
    attr_reader :ordonnance_token
                    
                    
     belongs_to :patient
     belongs_to :ordonnance
     belongs_to :adresse
     
  def ordonnance_token=(id)
    self.ordonnance_id = id
  end
end
