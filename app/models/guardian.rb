class Guardian < ApplicationRecord

  belongs_to :family

  validates :last_name, :presence => true

  validates :first_name, :presence => true

  validates :family_id, :presence => true
  

end
