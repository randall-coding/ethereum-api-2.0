module TransactionHelper
#require 'httparty'
#require 'json'

  def api_ethscan
    #API call uses eth_getTransactionByHash to get basic informaiton, then calls tx.full_data() to obtain data
    #...by address.
    @txInfo['response'] = JSON.parse HTTParty.get("#{@url}").response.body
    #save new transaction if valid response
    if(@txInfo['response']['result'])
      @txInfo['response']['result']['type'] = params[:mode]
      tx = Transaction.new
      tx.Thash =@txInfo['hash']
      tx.data= @txInfo['response'].to_json
      tx.full_data(params[:mode])
      @txInfo['response'] = JSON.parse tx.data
      if (tx.save)
        puts "transaction saved"
      else
        puts "transaction not saved"
      end
    end
  end #end api_ethscan()

  def adjust_values
    if (@txInfo['response']['result'])
      @divisor = BigDecimal.new(10**18)
      @value = BigDecimal.new(@txInfo['response']['result']['value'].to_i(16))
      @value /= @divisor
      @gas_price = BigDecimal.new(@txInfo['response']['result']['gasPrice'].to_i(16))
      @gas_price /= @divisor
    end
  end #end adjust_values()
end #end module
