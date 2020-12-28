class TodoItem < ApplicationRecord
  validates :title, presence: true
  # no need to validate description presence, is optional
end
