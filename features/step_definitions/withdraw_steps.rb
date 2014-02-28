Transform(/^\d+$/) do |num|
  num.to_i
end
Given(/^I am on My Account page$/) do
  visit(accounts_path)
end

Given(/^I have (\d+)$/) do |balance|
  find('input[name="account[balance]"]').value.to_i == balance
end

When(/^I input (\d+) to withdraw$/) do |amount|
  fill_in('account[amount]', :with => amount)
end

When(/^click (.+)$/) do |button|
  initial_balance = find('input[name="account[balance]"]').value.to_i
  click_on(button)
  final_balance = find('input[name="account[balance]"]').value.to_i
  @balance_status = if final_balance == 0
    'Empty'
  elsif final_balance < initial_balance
    'Deducted'
  elsif final_balance == initial_balance
    'Same'
  end
end

Then(/^my remaining balance should be (.+)$/) do |balance_status|
  balance_status == @balance_status
end

Then(/^Message should say (.+)$/) do |message|
  flash_message = find('.flash').text
  !flash_message.match(message).nil?
end





# Transform(/^\d+$/) do |num|
#   num.to_i
# end

# Given(/^I have (\d+) in my account$/) do |initial_balance|
#   @balance = initial_balance
# end

# When(/^I withdraw (\d+)$/) do |amount|
#   if @balance < amount
#     @message = "Failure"
#   else
#     @balance = @balance - amount
#     @message = "Success"
#   end
# end

# Then(/^My account should be left with (\d+)$/) do |balance|
#   @balance == balance
# end

# Then(/^Transaction should be a (Success|Failure)$/) do |message|
#   @message == message
# end

