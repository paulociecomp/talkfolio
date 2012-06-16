class Talk < ActiveRecord::Base
  attr_accessible :title, :description

  has_many :talk_submitions
  has_many :groups, :through => :talk_submitions


  def add_to_portfolio
    save
    self
  end
end