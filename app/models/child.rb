class Child < ApplicationRecord

  belongs_to :family

  belongs_to :user, :class_name => "Provider", :foreign_key => "provider_id"

  validates :last_name, :presence => true

  validates :first_name, :presence => true

end
