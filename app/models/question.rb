class Question < ApplicationRecord
  serialize :options, Array, coder: JSON

  belongs_to :quiz

  has_rich_text :text

  enum status: { inactive: "inactive", active: "active" }
end
