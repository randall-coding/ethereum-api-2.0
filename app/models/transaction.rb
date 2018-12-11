class Transaction < ApplicationRecord
  require 'httparty'
  validates :Thash ,uniqueness:true, presence:true
  validates :data , presence:true

  def api_ethaddr(mode)
    tx_data = JSON.parse self.data
    tx_data2 = nil
    address = tx_data['result']['from']

    if(mode == 'mainnet')
      addr_response = JSON.parse HTTParty.get("http://api.etherscan.io/api?module=account&action=txlist&address=#{address}&sort=asc").response.body
    else
      addr_response = JSON.parse HTTParty.get("http://api-ropsten.etherscan.io/api?module=account&action=txlist&address=#{address}&startblock=0&sort=asc&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J").response.body
    end

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

  def pretty_values()
    #convert ether, gas price number from 1E-18 to normal values
    tx_data = JSON.parse self.data
    divisor = BigDecimal.new(10**18)

    value = BigDecimal.new(tx_data['result']['value'].to_i(16))
    tx_data['result']['value'] = value /divisor
    gas_price = BigDecimal.new(tx_data['result']['gasPrice'].to_i(16))
    tx_data['result']['gasPrice'] = gas_price / divisor

    self.data = tx_data.to_json
  end #end adjust_values()
end
