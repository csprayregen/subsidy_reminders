class Family < ApplicationRecord

  has_many :children

  has_many :guardians

  belongs_to :user, :class_name => "Provider", :foreign_key => "provider_id"

  validates :provider_id, :presence => true

end
