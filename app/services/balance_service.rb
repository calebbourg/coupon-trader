class BalanceService
  
  def initialize(user, params = {})
    @params = params
    @user = user
  end

  def self.call(user, params)
    new(user, params).call
  end

  def call
    if @params[:balance_change] 
    	@user.update_balance(@params[:balance_change])
    	return @user
    else 
    	return false 
    end
  end
end