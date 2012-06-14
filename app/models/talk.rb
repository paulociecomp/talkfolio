class Talk < ActiveRecord::Base
  attr_accessible :title, :description

  def add_to_portfolio
    save
  end
end