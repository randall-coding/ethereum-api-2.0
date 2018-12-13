# Ethereum-api remastered.  

I made sure to make this code looks more like my best work rather than simply a first draft / MVP (ala Agile development).  

## Changes
* Code has been modularized, complex calculations are placed inside models when possible, minimal logic is placed in views.  
* Added additional transaction details (Total cost calculation, nonce/position, success has catch string if pre-Byzantium transaction).
* Variables in controller and model renamed for easier reading.  
* Mainnet/Ropsten buttons replaced with radio button. 
* Tests created for transaction model and for "basic search" integration.  Folder spec/models and spec/features.  Rspec 3.6/Capybara used.  
* New styles added, older styles deleted.
* Comments cleaned up and made to be concise.
* Code is fully functional on my computer / browser (Firefox) and now deployed on Heroku (https://www.randallcoding.com/api/ethereum).
* Sqlite DB used in development

![alt Image example](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum1.png)

### If you see this message ![alt Image error](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum2.png)
  This might mean you need to try Mainnet instead of Ropsten or vice verse.  Altneratively check to make sure you typed in
the transaction hash correctly 

### Tests are all working on my system.  
Try the test suite with `bundle exec rspec` (make sure rspec is installed with `rails generate rspec:install`)
![alt Test suite example](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum_tests.png)
