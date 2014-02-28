Before('@withdraw') do
  account = Account.new(:balance => 10000)
  account.save(:validate => false)
end