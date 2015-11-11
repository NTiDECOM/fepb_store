class User < ActiveRecord::Base
  # attr_accessor :name, :email, :avatar, :avatar_url
  validates_presence_of :name, :email
  # after_save :acc_created_notification
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader # Tells rails to use this uploader for this model.
  has_many :sales, dependent: :destroy

  private

  def initialize

  end

  def acc_created_notification
    UserMailer.acc_created(self).deliver_now
  end
end