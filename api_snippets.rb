# this code isn't actually called.  Remove after implementation is complete

class API < Sinatra::Base
  def initialize(ledger: Ledger.new)
    @ledger = ledger
    super()
  end
end

# Later, callers do this:
app = API.new(ledger: Ledger.new)

# Pseudocode for what happens inside the API class:

result = @ledger.record( { 'some' => 'data' } )
result.success?       # => a Boolean
result.expense_id     # => a number
result.error_message  # => a string or nil