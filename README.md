# Ethereum-api remastered  
Welcome to the future of cryptocurrency
## Changes
* Code is refactored, complex calculations are placed inside models when possible, minimal logic is placed in views.  
* Added additional transaction details (Total cost calculation, nonce/position, success has catch string if pre-Byzantium transaction).
* Variables in controller and model renamed for easier reading.  
* Mainnet/Ropsten buttons replaced with radio button.
* Tests created for transaction model and for "basic search" acceptance test.  Folder spec/models and spec/features.  Rspec 3.8/Capybara 3.12.0 in use.  
* Using CircleCI for continous integration
* New styles added, older styles deleted (CSS)
* Sqlite DB used in development, Postgres in production
* Code is fully functional on my computer / browser (Firefox)
* Now deployed on Heroku (https://www.randallcoding.com/api/ethereum).

### Search example
![alt Image example](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum1.png)
___
### If you see this message ![alt Image error](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum2.png)
This might mean you need to try Ropsten instead of Mainnet or vice verse.  Altneratively check to make sure you typed in
the transaction hash correctly
___
### Tests are working on my system.  
Try the test suite with `bundle exec rspec spec`. Make sure rspec is installed with `rails generate rspec:install`  Rspec version is 3.8, Capybara is 3.12.0

![alt Test suite example](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum_tests.png)

### CircleCI is implemented for this repository
Upon upload of new branch, branch code is automatically checked against all spec using CirclCI continuous integration service.
