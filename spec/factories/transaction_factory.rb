

def makeTransaction1()
  newTx = Transaction.new(txHash: "0x4f85d4e93eaa5cd77fd79671b175b380cfc1f8d9635990c14bddb8725efa5250"   , data: '{"blockHash":"0xdc574dbf360028974fb137334a9452e2d83c3008bb5f03c0fff52c4382c1af43","blockNumber":"0x263a7d","from":"0x7fdf06809fb9069226ef1d291e4d0ba9b4b717f6","gas":"0xe57e0","gasPrice":"0.00000004","hash":"0x3419e1374dcb8ff1722652d1eab79bfdcf9348c25edefeb0239e2393c557b89f","input":"0xe75623d8000000000000000000000000940702aa202322d67214872d272ae61f1bb8eebf","nonce":"66","to":"0xf722717d938bc14cd66fe558135d665d90c955b8","transactionIndex":"0x16","value":"0.0","v":"0x1b","r":"0x291c4c510365aa7bcc695e0cb10acda0c47713b759a7df8bfc8be0cde8cf6c5b","s":"0x6b795bf87d2bc53fd44e47e14ae02f5f15baae5e8121ba95a90ae15da9705ca0","type":"mainnet","txreceipt_status":"","timeStamp":"1477400858","gasUsed":"31725","cost":null,"position":"22"}')
  return newTx
end

def makeTransaction2()
  newTx = Transaction.new(txHash:'0x79f333748c61a896d21c6f4d8dd9c8431107be0ba12b440a92fa4da058b3810d', data: '{"blockHash":"0x0469235f147d00b054f1a1dd077847a0bf9b03a0423e2410e5e3132898e29f74","blockNumber":"0x263ade","from":"0x7fdf06809fb9069226ef1d291e4d0ba9b4b717f6","gas":"0xe57e0","gasPrice":"0.00000004","hash":"0x79f333748c61a896d21c6f4d8dd9c8431107be0ba12b440a92fa4da058b3810d","input":"0x03bf4fb7000000000000000000000000dd6a51b832f45b554823b4cd8503311551b7c16d","nonce":"88","to":"0xf722717d938bc14cd66fe558135d665d90c955b8","transactionIndex":"0x16","value":"0.0","v":"0x1b","r":"0x4b88558674e83bae5ed7a4c53ca3415f0a57ab84275e6583f4ac65fd8d42a272","s":"0x3141a8f6a99bbc68aed41512ce49f1df933bd5fc4bb098cfa7e9685bfdd7fa7","type":"mainnet","txreceipt_status":"","timeStamp":"1477402034","gasUsed":"46141","cost":null,"position":"22"}')
  return newTx
end

def clearDB()
  if (Transaction.first)
    Transaction.delete_all
    puts "DB cleaned"
  end
end 
