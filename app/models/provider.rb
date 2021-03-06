class Provider < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :children
  has_many :families

  validates :last_name, :presence => { :message => "Please enter your last name." }

  validates :first_name, :presence => { :message => "Please enter your first name" }

  validates :business_type, :presence => true


  # , :inclusion => { :in => [ 'License Exempt', 'Licensed Home Daycare', 'Licensed Group Home' ] }

end
