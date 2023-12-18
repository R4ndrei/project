class Column < ApplicationRecord
  belongs_to :board
  has_many :stories, -> { order(position: :asc) }, dependent: :destroy
  acts_as_list scope: :board
end
