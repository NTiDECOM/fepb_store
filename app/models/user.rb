class User < ActiveRecord::Base
  # attr_accessor :name, :email, :avatar, :avatar_url
  validates_presence_of :name
  validates_uniqueness_of :cpf
  # after_save :acc_created_notification
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader # Tells rails to use this uploader for this model.
  has_many :sales, dependent: :destroy
end