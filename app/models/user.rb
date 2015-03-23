class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Strip leading and trailing whitespace and set to nil if blank
  normalize_attributes :username

  # Validations
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       format: { with: /\A[\w-]{3,16}\z/, message: "only allows users comprised of 3 to 16 characters of letters and numbers" }

  # Callbacks
  before_create :set_gamification_mode

  private

  def set_gamification_mode
    # Get the last user that's confirmed
    latest_user = User.where.not(confirmed_at: nil).order(created_at: :desc).take
    # Determine/toggle the gamification status based on the last user ... and
    # keep gamification = false as the default.
    if latest_user
      mode = !latest_user.gamified
    else
      mode = false
    end
    self.gamified = mode
    true
  end
end
