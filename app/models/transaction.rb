class Transaction < ApplicationRecord
  require 'httparty'
  validates :txHash ,uniqueness:true, presence:true
  validates :data , presence:true

  def api_ethaddr(mode)
    tx_data = JSON.parse self.data
    tx_data2 = nil
    address = tx_data['from']

    if(mode == 'mainnet')
      addr_response = JSON.parse HTTParty.get("http://api.etherscan.io/api?module=account&action=txlist&address=#{address}&sort=asc").response.body
    else
      addr_response = JSON.parse HTTParty.get("http://api-ropsten.etherscan.io/api?module=account&action=txlist&address=#{address}&startblock=0&sort=asc&apikey=7HH9ACPSQ4K45G31J8C488EUGMTRGYAI4J").response.body
    end
    addr_response = addr_response['result']

    (addr_response).each do |t|
      if t['hash'] == tx_data['hash']
        tx_data2 = t
      end
    end

    if (tx_data2)
      tx_data['txreceipt_status'] = tx_data2['txreceipt_status']
      tx_data['timeStamp'] = tx_data2['timeStamp']
      tx_data['gasUsed'] = tx_data2['gasUsed']
      tx_data['cost'] = tx_data2['cost']
      tx_data['nonce'] = tx_data2['nonce']
      tx_data['position'] = tx_data2['transactionIndex']
      tx_data['input'] = tx_data2['input']
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

    value = BigDecimal.new(tx_data['value'].to_i(16))
    tx_data['value'] = value /divisor
    gas_price = BigDecimal.new(tx_data['gasPrice'].to_i(16))
    tx_data['gasPrice'] = gas_price / divisor

    self.data = tx_data.to_json
  end #end adjust_values()
end
