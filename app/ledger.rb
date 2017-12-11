module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  class Ledger
    def record(expense)
      if expense.key?('payee')
        save_expense(expense)
      else
        expense_invalid
      end
    end

    def expenses_on(date)
      DB[:expenses].where(date: date).all
    end

    private

    def save_expense(expense)
      DB[:expenses].insert(expense)
      id = DB[:expenses].max(:id)
      RecordResult.new(true, id, nil)
    end

    def expense_invalid
      message = 'Invalid Response: `payee` is required'
      RecordResult.new(false, nil, message)
    end
  end
end