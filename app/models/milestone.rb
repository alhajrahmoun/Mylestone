class Milestone < ApplicationRecord
  enum status: [:open, :secret]
  belongs_to :user
  validate :date_not_in_future, on: :create

  scope :open, -> {where(status: :open)}

  def date_not_in_future
    logger.info self.inspect
    errors.add('error:', "Milestone date can't be in the future") if self.date > Date.today
  end
end
