class Entry < ApplicationRecord
  belongs_to :child
  belongs_to :prompt

  has_rich_text :response
end
