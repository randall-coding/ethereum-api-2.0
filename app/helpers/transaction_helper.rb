module TransactionHelper
  def api_ethscan
    #API call uses eth_getTransactionByHash to get basic informaiton, then calls tx.full_data() to obtain data
    #...by address.
    txInfo = {}
    full_response = JSON.parse HTTParty.get("#{@url}").response.body
    txInfo['response'] = full_response['result']
    puts "full_response"
    puts full_response
    puts "\nurl"
    puts @url
    #set mode
    if(txInfo['response'])
      txInfo['response']['type'] = params[:mode]
    end

    transaction = make_transaction(txInfo)

    if  (transaction)
      txInfo['response'] =(JSON.parse transaction.data)
      puts "Yes"
    else
      txInfo['response'] = nil
      puts "No"
    end

    return txInfo['response']
  end #end api_ethscan()

  def make_transaction(txInfo)
    #save new transaction if valid response.  returns saved transaction
    if(txInfo['response'])
      tx = Transaction.new
      tx.Thash = params[:hash].strip
      tx.data= txInfo['response'].to_json
      tx.api_ethaddr(params[:mode])  #expand data with API call (by address)
      tx.pretty_values()

      if (tx.save)
        puts "transaction saved"
      else
        puts "transaction not saved"
      end

      return tx
    else
      puts "no response"
      return nil
    end


  end #end make_transaction
end #end module
