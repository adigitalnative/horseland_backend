# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Secret Goings On

Secrets in this app are stored in credentials.yml.enc, as is right and proper for a Rails 5.2+ application. `master.key` should not be pushed up to any github etc because it will contain the encryption key. If you need to grant someone else access to the credentials, there are numerous ways to share the master key so they can also unencrypt as needed.

### To add something to the encrypted secrets file, use
`EDITOR="subl --wait" bin/rails credentials:edit` to access the file, change the token, etc. `subl` can be replaced with any editor you prefer.

### Accessing secured credentials
Use something like `Rails.application.credentials.dig(:jwt_secret_token)` to get to stored information.

Details are here: https://www.viget.com/articles/storing-secret-credentials-in-rails-5-2-and-up/
