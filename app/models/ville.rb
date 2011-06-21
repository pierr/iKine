# == Schema Information
# Schema version: 20110608103621
#
# Table name: villes
#
#  id  :integer         not null, primary key
#  nom :string(255)
#

class Ville < ActiveRecord::Base
  has_one :code_insee
  has_many :code_postals, :through => :code_insee
  
  
  def as_json(options)
  { 
   :id => id,
   :name => name
  }
  end

private
  
  def name
    "#{nom}"
  end
  

  def ville_token=(id)
    self.id = id
  end
  
  def ville_token
    return self.id
  end  
  
  
end
