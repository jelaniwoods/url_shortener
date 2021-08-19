class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :roles, :integer_enum, allow: User.roles.keys

  # Direct associations

  has_many :urls

  # Indirect associations
end
