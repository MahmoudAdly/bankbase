class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  validates :name, length: { in: 2..24 }

  has_many :sent_transactions, class_name: "Transaction", foreign_key: "sender_id"
  has_many :received_transactions, class_name: "Transaction", foreign_key: "receiver_id"

  # TODO: Move out of the model to a separate helper or service.
  def all_transactions
    Transaction.where(sender: self).or(Transaction.where(receiver: self))
  end
end
