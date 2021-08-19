class User < ApplicationRecord
  enum roles: { "admin" => 0, "free" => 1, "pro" => 2 }

  include JwtToken
  # Direct associations

  has_many   :urls,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
