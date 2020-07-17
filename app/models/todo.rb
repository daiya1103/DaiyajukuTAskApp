class Todo < ApplicationRecord
  belongs_to :user
  has_many :todocontents
  accepts_nested_attributes_for :todocontents, reject_if: :all_blank, allow_destroy: true
end
