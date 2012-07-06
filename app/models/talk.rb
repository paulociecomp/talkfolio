class Talk < ActiveRecord::Base
  attr_accessible :title, :description

  has_many :submitions, :class_name => "TalkSubmition"
  has_many :groups,     :through => :submitions


  def add_to_portfolio
    save
    self
  end

  def submition_of(group)
    submitions.find_by_receiver_id(group.id)
  end
end