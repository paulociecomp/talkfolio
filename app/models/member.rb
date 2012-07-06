class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :accepted, where(:accepted => true)
  scope :pending, where(:accepted => false)

  delegate :email, :name, :to => :user

  def pending?
    !accepted?
  end

  def accept!
    self.accepted = true
    save
  end

  ROLES = ['founder', 'admin']

  def change_role(role)
    self.role = role.to_s
    save
  end

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end
end