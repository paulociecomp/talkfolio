class Talk < ActiveRecord::Base
  attr_accessible :title, :description

  belongs_to :user

  has_many :submitions, :class_name => "TalkSubmition"
  has_many :groups,     :through => :submitions


  def add_to_user_portfolio(user)
    self.user = user
    save
    self
  end

  def submition_of(group)
    submitions.find_by_receiver_id(group.id)
  end
end