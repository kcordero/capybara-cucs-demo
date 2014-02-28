class Account < ActiveRecord::Base
	attr_accessor :amount

	scope :with_balance, -> { where('balance > 0') }
	
	validate :valid_amount

	def withdraw
		diff = balance.to_i - amount.to_i
		self.balance = diff
		res = self.save
		reload
		res
	end

	private

	def valid_amount
		errors[:amount] << 'must be more than 0.' if amount.to_i <= 0
		errors[:balance] << 'not enough.' if balance_was.to_i < amount.to_i
	end
end
