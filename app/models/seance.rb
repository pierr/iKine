# == Schema Information
# Schema version: 20110521192843
#
# Table name: seances
#
#  id            :integer         not null, primary key
#  date_debut    :datetime
#  duree         :integer
#  commentaire   :string(255)
#  paye          :boolean
#  a_domicile    :boolean
#  ordonnance_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Seance < ActiveRecord::Base
  
  belongs_to :ordonnance
  
end
