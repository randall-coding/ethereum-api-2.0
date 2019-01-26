# Ethereum-api remastered  
Welcome to the future of cryptocurrency

## Specs
Ruby 2.5.1    Rails 5.2.2   Sqlite 1.3.13  Etherscan API  

## Table of Contents
* [Changes](#changes)
* [Features and Function](#features)
* [Getting Started](#getting-started)

## Features
* Search the Ethereum blockchain using Etherscan API

* Search any Etherscan compliant transaction hashs (see https://etherscan.io/txs for a list of transactions)

* Searches Mainnet (main network) and Ropsten (test network)

* Deployed on Heroku

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

## Getting started
### Search example
![alt Image example](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum1.png)
___
<br>

### If you see this message ![alt Image error](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum2.png)
This might mean you need to try Ropsten instead of Mainnet or vice verse.  Altneratively check to make sure you typed in
the transaction hash correctly
___
<br>

### Tests are working on my system.  
Try the test suite with `bundle exec rspec spec`. Make sure rspec is installed with `rails generate rspec:install`  Rspec version is 3.8, Capybara is 3.12.0

![alt Test suite example](https://raw.githubusercontent.com/Randall-Coding/Showcase/master/app/assets/images/ethereum_tests.png)

### CircleCI is implemented for this repository
Upon upload of new branch, branch code is automatically checked against all spec using CircleCI continuous integration service.
