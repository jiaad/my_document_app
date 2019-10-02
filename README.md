# My personal Documentation App

> i am creating this application to expand my knowledge in web development
>
> its purpose is to be used as a documentation for myself
>
> i am implementing features and will add new features as soon as possible

## features at the moment

- auth(Devise, confirmation with mailer, password reset etc..)
- admin(with enum)
- post multiple images with active storage

## features coming

- search
- real time comment
- messaging
- follow

## TDD AND BDD

- i will implement rspec & capybara etc..

## maybe be i will implement

- client side with Vue or REACT or i will create another repo to implement REACT OR VUE
- Drag and drop for Active storage

## to try it in local

```
you will need to implement a .ENV file

i have used MAILJET for mailer : next 3 keys are for mailjet
PUBLIC_MAILJET=''
SECRECT_MAILJET=''
EMAIL_MAILJET=''

```

```
git clone git@github.com:jiaad/my_document_app.git
bundle install
rails db:create
rails db:migrate
rails server
```
