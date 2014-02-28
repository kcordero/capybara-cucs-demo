class AccountsController < ApplicationController

	def index
		@account = Account.with_balance.reload.first # || Account.new
		# @account.balance = 10000 if @account.balance == 0
		# @account.save(:validate => false)
	end

	def withdraw
		@account = Account.find_by_id(params[:id])
		@account.amount = params[:account][:amount].to_i
		if @account.withdraw
			flash[:notice] = 'Successful'
		else
			flash[:error] = "Failure: #{@account.errors.full_messages}"
		end

		render :template => 'accounts/index'
	end

end