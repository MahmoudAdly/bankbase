class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_user_transactions = current_user.all_transactions
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    # TODO:
    # - Move that logic to a new service.
    # - Schedule a job to process the new transaction.
    @transaction.sender = current_user
    @transaction.exchange_rate = FetchExchangeRate.new(@transaction.source_currency,
                                                       @transaction.target_currency).call

    if @transaction.save
      Resque.enqueue(TransactionProcessorJob, @transaction.id)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private def transaction_params
    params.require(:transaction).permit(:receiver_id,
                                        :source_currency,
                                        :target_currency,
                                        :amount)
  end
end
