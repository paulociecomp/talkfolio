class Group < ActiveRecord::Base
  attr_accessible :name, :description

  def self.found(params)
    create(params)
  end
end