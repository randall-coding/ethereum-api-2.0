# Ethereum-api remastered.  

I made sure to make this code looks more like my best work rather than simply a first draft / MVP (ala Agile development).  

## Changes
* Code has been modularized, complex calculations are placed inside models when possible, minimal logic is placed in views.  
* Added additional transaction details (Total cost calculation, nonce/position, success has catch string if pre-Byzantium transaction).
* Variables in controller and model renamed for easier reading.  
* Mainnet/Ropsten buttons replaced with radio button. 
* Tests created for transaction model and for "basic search" integration.  Folder spec/models and spec/features.  Rspec 3.6/Capybara used.  
* New styles added, older styles deleted.  Comments cleaned up and made to be concise.
* Sqlite DB used in development
* Code is fully functional on my computer / browser (Firefox)
* Now deployed on Heroku (https://www.randallcoding.com/api/ethereum).

### Search example
![alt Image example](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum1.png)
___
### If you see this message ![alt Image error](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum2.png)
^ This might mean you need to try Ropsten instead of Mainnet or vice verse.  Altneratively check to make sure you typed in
the transaction hash correctly 
___
### Tests are working on my system.  
Try the test suite with `bundle exec rspec`. Make sure rspec is installed with `rails generate rspec:install`
![alt Test suite example](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum_tests.png)
