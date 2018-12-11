class Transaction < ApplicationRecord
  require 'httparty'
  validates :Thash ,uniqueness:true, presence:true
  validates :data , presence:true

  def full_data(mode)
    tx_data = JSON.parse self.data
    address = tx_data['result']['from']

    if(mode == 'mainnet')
      addr_response = JSON.parse HTTParty.get("http://api.etherscan.io/api?module=account&action=txlist&address=#{address}&sort=asc").response.body
    else
      addr_response = JSON.parse HTTParty.get("http://api-ropsten.etherscan.io/api?module=account&action=txlist&address=#{address}&startblock=0&sort=asc&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J").response.body
    end
    tx_data2 = nil
    (addr_response['result']).each do |t|
      if t['hash'] == tx_data['result']['hash']
        tx_data2 = t
      end
    end

    if (tx_data2)
      tx_data['txreceipt_status'] = tx_data2['txreceipt_status']
      tx_data['timeStamp'] = tx_data2['timeStamp']
    else
      puts "*** error could not find transaction details using from address.  transaction.rb ***"
      tx_data['txreceipt_status'] = ""
    end

    self.data = tx_data.to_json
  end #end full_date()
end
