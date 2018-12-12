require 'rails_helper'

RSpec.describe Transaction, type: :model do
    tx_good = Transaction.new(txHash: "0x3419e1374dcb8ff1722652…edefeb0239e2393c557b89f"   , data: )
    tx_bad = Transaction.new(txHash:nil,data:nil)
end
