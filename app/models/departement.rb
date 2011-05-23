# == Schema Information
# Schema version: 20110521192843
#
# Table name: departements
#
#  id         :integer         not null, primary key
#  numero     :string(255)
#  nom        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Departement < ActiveRecord::Base
  
  has_many :villes
  
end
