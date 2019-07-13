class Transaction < ApplicationRecord
  extend Enumerize

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :sender,
            :receiver,
            :source_currency,
            :target_currency,
            :amount,
            :exchange_rate,
            :status,
            presence: true
end
