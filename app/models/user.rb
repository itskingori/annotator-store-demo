class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Strip leading and trailing whitespace and set to nil if blank
  normalize_attributes :username

  # Validations
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A[\w-]{3,16}\z/, message: "only allows users comprised of 3 to 16 characters of letters and numbers" }
end
