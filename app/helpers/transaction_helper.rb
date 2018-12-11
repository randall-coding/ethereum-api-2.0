module TransactionHelper
  def api_ethscan
    #API call uses eth_getTransactionByHash to get basic informaiton, then calls tx.full_data() to obtain data
    #...by address.
    @txInfo['response'] = JSON.parse HTTParty.get("#{@url}").response.body
    #set mode
    if(@txInfo['response']['result'])
      @txInfo['response']['result']['type'] = params[:mode]
    end
    #save new transaction if valid response
    if(@txInfo['response']['result'])
      tx = Transaction.new
      tx.Thash = @txInfo['hash']
      tx.data= @txInfo['response'].to_json
      tx.api_ethaddr(params[:mode])
      tx.pretty_values()

      @txInfo['response'] = JSON.parse tx.data
      if (tx.save)
        puts "transaction saved"
      else
        puts "transaction not saved"
      end
    end
  end #end api_ethscan()

end #end module
