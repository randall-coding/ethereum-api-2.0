
100.times do |i|
    Transaction.create(txHash:"meh#{i}",data:"meh-data#{i}")
end
