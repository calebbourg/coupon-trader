class BalanceService
  
  def initialize(user, params = {})
    @params = params
    @user = user
    Struct.new( 'Result', :success?, :error_messages)
  end

  def self.call(user, params)
    new(user, params).call
  end

  def call 
    @user.update_balance(@params[:balance_change])
    if @user.errors.present?
    	@result = Struct::Result.new(false, @user.errors.full_messages)
    else
    	@result = Struct::Result.new(true, nil)
    end
    return @result
  end
end