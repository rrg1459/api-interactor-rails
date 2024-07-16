# README

In this app we will develop how to work with the **interactor-rails** gem.


 $ ```ruby --version```  
ruby 2.7.8p225 (2023-03-30 revision 1f4d455848) [x86_64-linux]

 $ ```rails --version```  
Rails 7.0.4.3

 $ ```psql --version```  
psql (PostgreSQL) 15.7 (Debian 15.7-0+deb12u1)

 $ ```rails new app-api -d postgresql```

 $ ```bundle install```

 $ ```bundle add interactor-rails```

 $ ```rails generate interactor create_user```

 $ ```rails server```

## Using postman

With the POST method and route  
http://localhost:3000/api/v1/sign_up

and in the *body y form-data*

| Key | Value |
|---|---|
| user[email] | carl@gmail.com |
| user[password] | 123456 |
| user[password_confirmation] | 123456 |
| user[name] | Carl |
| user[borned_at] | 1985-08-10 |
---
With the POST method and route  
http://localhost:3000/api/v1/campaign_sign_up

and in the *body y form-data*

| Key | Value |
|---|---|
| user[email] | amanda@gmail.com |
| user[password] | 123456 |
| user[password_confirmation] | 123456 |
| user[name] | Amanda |
| user[borned_at] | 1985-08-10 |

---

### Case of use:

In this application, users can be created normally from the frontend in the SignUp component and users can also be created in campaigns via API.

---

### Proposed solution:

To solve this problem, use the __interactor__ design pattern and create the user once with the DRY (Don't Repeat Yourself) principle with the CreateUser interactor.

When a user is created from the frontend, a welcome email is sent to the user, we can see this in the SignUpUser interactor

When a user is created in a campaign, an email is sent to the user creation notification in the campaign. We can see this in the CampaignSignUpUser interactor.

---

With the __interactor__ design pattern we can maintain the convention of skinny controllers and skinny models and the SRP (Single Responsibility Principle) KISS (Keep It Simple) principles.

---