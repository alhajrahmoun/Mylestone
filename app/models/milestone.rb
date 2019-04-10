class Milestone < ApplicationRecord
  enum status: [:open, :secret]
  belongs_to :user
  validate :date_not_in_future, on: :create

  def date_not_in_future
    errors.add('error:', "Milestone date can't be in the future") if self.date > Date.current
  end
end
