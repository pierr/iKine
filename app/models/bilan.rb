# == Schema Information
# Schema version: 20110616110935
#
# Table name: bilans
#
#  id                 :integer         not null, primary key
#  initial            :string(255)
#  date_initial       :date
#  intermediaire      :string(255)
#  date_intermediaire :date
#  final              :string(255)
#  date_final         :date
#  ordonnance_id      :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Bilan < ActiveRecord::Base
  belongs_to :ordonnance , :validate => true, :autosave => true
  attr_accessible :initial, 
                  :date_initial, 
                  :intermediaire , 
                  :date_intermediaire, 
                  :final, 
                  :date_final, 
                  :ordonnance, 
                  :ordonnance_id, 
                  :ordonnance_token
  attr_reader :ordonnance_token
  
  accepts_nested_attributes_for :ordonnance, :allow_destroy => true #FIXME est ce utile? à dérerminer
  
  def ordonnance_token=(id)
    self.ordonnance_id = id
  end
end
