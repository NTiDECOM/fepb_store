class User < ActiveRecord::Base
  validates_presence_of :name, :email
  after_save :acc_created_notification
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  private

  def acc_created_notification
    UserMailer.acc_created(self).deliver_now
  end
end