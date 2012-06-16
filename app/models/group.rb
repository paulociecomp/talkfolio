class Group < ActiveRecord::Base
  attr_accessible :name, :description

  def found
    save
    self
  end
end