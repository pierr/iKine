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
