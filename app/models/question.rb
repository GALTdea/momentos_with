class Question < ApplicationRecord
  belongs_to :quiz

  has_rich_text :text
end
