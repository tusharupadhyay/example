# README

This application is created for Merchant Link.

* Application design decisions and assumption:

This application consist of one Database table. The DB schema is as follow:

Table Name: Terminal

Columns : ID, Name, Description, Terminal_attributes, created_at, updated_at

Terminal_attributes column is Flex column which can hold multiple attributes entry.

In order to achieve that, Terminal_atttributes column is STORE type column which can store multiple key: value entries. I used store type instead of making it serialized in order to better access of
attributes available in the column using . operator.

As a design decision I have provided only two attributes called "type" and "operating_system" which can directly be accessed using . operation.
eg:

Terminal.first.operating_system = "Windows"
Terminal.first.type = "Console_terminal"

As a design decision, the name column can not be nill.

If additional attributes regarding Terminal we want to add, we can directly provide accessor in a model file for column Terminal_attributes and rails will let us
read/save using . operator instead of iterating over the hashmap available in Terminal_attributes column.  

* APIs available by this application:

This application provides all the CRUD operation REST APIs and their respective UI components.

Additionally, this application provides JSON and XML response for the following API calls:

Request: GET www.example.com/terminals.xml ------> Response: Lists all the terminals in xml format

Request: GET www.example.com/terminals.json ------> Response: Lists all the terminals in json format


* Ruby version

ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32]

* Rails version

Rails 5.1.6

* System dependencies

Windows

* Configuration

After pulling the repository in your local machine and after configuring ruby and rails version dependencies, please got to the application location and execute the below command:

bundle install

* Database creation

rails db:migrate

* How to run the test suite

This application provides rspec automated functional tests of all the APIs and automated tests of models as well. From the root location of the application, please execute the below command:

rspec

it will execute all the test suit code and will generate a report of how much code has been covered by the tests. Code coverage for this application is 100%.

* How to run the Application

rails s

go to "localhost:3000/terminals" in your browser for browser driven application.
