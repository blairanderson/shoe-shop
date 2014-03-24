[![Code Climate](https://codeclimate.com/github/blairanderson/shoe-shop.png)](https://codeclimate.com/github/blairanderson/shoe-shop)

## Shoe Shop

### Ruby version
Current on `ruby '2.1.0'` as seen on the top of the gemfile

### Configuration
Currently configured for heroku. Would be happy to merge cap scripts if someone submits a PR.

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
