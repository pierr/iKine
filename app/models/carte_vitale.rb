# == Schema Information
# Schema version: 20110616110935
#
# Table name: carte_vitales
#
#  id          :integer         not null, primary key
#  numero_secu :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class CarteVitale < ActiveRecord::Base
  has_many :patients
end
