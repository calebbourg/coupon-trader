class TransactionsService

  def initialize(coupon, requester, poster)
    @coupon = coupon
    @requester = requester
    @poster = poster
  end


  def self.call(coupon,requester,poster)
    new(coupon,requester,poster).call
  end

  def call
    @coupon.with_lock do # lock coupon and wrap block in a transaction
      @requester.lock!(true)# no concurrency for requesters balance
      @transaction = Transaction.new(coupon_id: @coupon.id, poster_id: @poster.id, requester_id: @requester.id)
      five_percent = @coupon.value * 0.05
      transaction_value = @coupon.value - five_percent
      @marketplace = MarketplaceClient.first_or_create!
      @marketplace.update_revenue(five_percent)
      @poster.update_balance(transaction_value)
      @requester.update_balance(-@coupon.value)
      @coupon.update(user_id: @requester.id)
      @transaction.save!
      @result = OpenStruct.new(status: 'success', transaction: @transaction)
    end
    rescue
      @result = OpenStruct.new(status: 'failed', transaction: @transaction)# return errors for transaction if anything goes wrong
  end
end