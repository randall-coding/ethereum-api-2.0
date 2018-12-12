require 'rails_helper'

RSpec.describe Transaction, type: :model do
    tx_good = Transaction.new(txHash:   , data:)
    tx_bad = Transaction.new(txHash:nil,data:nil)
end
