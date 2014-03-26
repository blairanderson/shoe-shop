[![Code Climate](https://codeclimate.com/github/blairanderson/shoe-shop.png)](https://codeclimate.com/github/blairanderson/shoe-shop)
[![Build Status](https://travis-ci.org/blairanderson/shoe-shop.svg?branch=master)](https://travis-ci.org/blairanderson/shoe-shop)
[![Coverage Status](https://coveralls.io/repos/blairanderson/shoe-shop/badge.png)](https://coveralls.io/r/blairanderson/shoe-shop)

## Shoe Shop

### Ruby version
Current on `ruby '2.1.0'` as seen on the top of the gemfile

### Configuration
Currently configured for heroku. Would be happy to merge cap scripts if someone submits a PR.

these are the current configs required.

```bash
ADMINB:                       <email#1@email.com>
ADMINJ:                       <email#1@email.com>
NEW_RELIC_APP_NAME:           <your app name>
SENDGRIDPASSWORD:             <sendgrid pw>
SENDGRIDUSERNAME:             <sengrid username>
SENDGRID_PASSWORD:            <pw>
TWITTER_ACCESS_TOKEN:         <access token>
TWITTER_ACCESS_TOKEN_SECRET:  <token secret>
TWITTER_CONSUMER_KEY:         <consumer key>
TWITTER_CONSUMER_SECRET:      <consumer secret>

```


### Database creation
`$ rake db:create db:migrate`

### How to run the test suite
`$ rake spec`

### Services (job queues, cache servers, search engines, etc.)
none yet

### Deployment instructions
```bash
$ git push heroku master
$ heroku run rake db:migrate
```
