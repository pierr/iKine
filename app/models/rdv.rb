# == Schema Information
# Schema version: 20110521192843
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
  
  belongs_to :patient
  belongs_to :adresse
  
end
