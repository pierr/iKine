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
#  created_at         :datetime
#  updated_at         :datetime
#

class Bilan < ActiveRecord::Base
  belongs_to :ordonnance , :validate => true, :autosave => true
  attr_accessible :initial, :date_initial, :intermediaire , :date_intermediaire, :final, :date_final, :ordonnance, :ordonnance_id
  accepts_nested_attributes_for :ordonnance, :allow_destroy => true
end
