class CarteVitale < ActiveRecord::Base
  has_many :patients
end
