Before('@withdraw') do
  account = Account.with_balance.reload.first
  unless account
  	account = Account.new
  	account.balance = 1000
  	account.save(:validate => false)
  end
end