class Application < ApplicationRecord
  belongs_to :vacancy
  belongs_to :candidate
end
