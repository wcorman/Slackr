class Slack < ApplicationRecord
  belongs_to :user

  validates :prod_time, {
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  }
  validates :unprod_time, {
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  }
  validates :sleep_time, {
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  }

  # validates :prod_time, presence: true
  # validates :unprod_time, presence: true
  # validates :sleep_time, presence: true
  #


end
