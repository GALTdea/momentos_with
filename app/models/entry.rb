class Entry < ApplicationRecord
  belongs_to :child
  belongs_to :prompt
end
