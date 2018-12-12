require 'rails_helper'

RSpec.describe Transaction, type: :model do
    tx_good = Transaction.new(Thash: "0x6f61ee4dc528443d8b6ab12240a53588fb72c659e1abfe6e6cc0d2346359be4a"   , data: \
'{"blockHash":"0xdc574dbf360028974fb137334a9452e2d83c3008bb5f03c0fff52c4382c1af43","blockNumber":"0x263a7d","from":"0x7fdf06809fb9069226ef1d291e4d0ba9b4b717f6","gas":"0xe57e0","gasPrice":"0.00000004","hash":"0x3419e1374dcb8ff1722652d1eab79bfdcf9348c25edefeb0239e2393c557b89f","input":"0xe75623d8000000000000000000000000940702aa202322d67214872d272ae61f1bb8eebf","nonce":"66","to":"0xf722717d938bc14cd66fe558135d665d90c955b8","transactionIndex":"0x16","value":"0.0","v":"0x1b","r":"0x291c4c510365aa7bcc695e0cb10acda0c47713b759a7df8bfc8be0cde8cf6c5b","s":"0x6b795bf87d2bc53fd44e47e14ae02f5f15baae5e8121ba95a90ae15da9705ca0","type":"mainnet","txreceipt_status":"","timeStamp":"1477400858","gasUsed":"31725","cost":null,"position":"22"}
')
    tx_bad_nil = Transaction.new(Thash:nil,data:nil)

    it "saves good transaction" do 
      expect(tx_good.save).to be true
    end

    describe "doesn't save bad transactions," do  
     before {tx_bad_dup = Transaction.create(Thash:tx_good.Thash,data:tx_good.data)}
     it "doesn't save nil values" do 
       expect(tx_bad_nil.save).to be_falsey
      end	
  end
end

