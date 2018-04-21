class Terminal < ApplicationRecord
  validates :name, presence: true

  store :terminal_attributes, accessors: [:type, :operating_system], coder: JSON
end
