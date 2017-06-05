class Family < ApplicationRecord

  has_many :children, :dependent => :destroy

  has_many :guardians

  belongs_to :user, :class_name => "Provider", :foreign_key => "provider_id"

  validates :provider_id, :presence => true

  validates :name, :presence => true

end
