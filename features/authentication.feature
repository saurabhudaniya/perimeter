Feature: user should be able to login using his credentials

Scenario: Check user login credentials before logging in
      Given a registered user with his credentials
      When user enter user his login credentials
      Then user should see welcome page with his information

Scenario: user should see his options and his respective components
         Given a user with all his details
         Given user should able to see all his options like create product , create article , show article, show product      
         When user clicks on options
         
         
         

