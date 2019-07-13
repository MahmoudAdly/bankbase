class TransactionProcessorJob
  @queue = :transactions

  def self.perform(transaction_id)
    # TODO: Add the real implementation here:
    # - Check the sender's balance validity.
    # - Based on step #1: Perform the transaction or mark it as failed.
    # FIXME: The first message is printed in the Docker log and then nothing happens!
    puts "Processing Transaction #{transaction_id}"
    transaction = Transaction.find!(transaction_id)
    puts "Found Transaction #{transaction_id}"
    transaction.update!(status: :finished)
    puts "Processed Transaction #{transaction_id}"
  end
end
