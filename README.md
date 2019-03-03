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



#Problem

As a company, we need to get various types of files securely from customers. For example, we get periodic insurance claims data. Our customers
don't always have accounts, so they can't login to do the upload. We need a way for "anonymous" users to send us a file in a secure manner.

#Goal
Create a RubyOnRails application that allows an administrator to set up third party secure file uploads.

#Workflow
An admin will create a link for a third-party user. The admin will send the link to a third-party user. The third-party user will receive the link and
follow it to a page where they can securely upload their file.

# Requirements
1. An admin should be able to log in and see a list of uploaded files.
2. Each file should have metadata associated with it. This includes things like:
  * Filename
  * Description
3. The file should be uploaded to Amazon S3. [ This isn't required for complete, but it should be easy to switch it to S3 when desired. ]
4. An admin should be able to create a "place" for a file to be uploaded.
5. An admin should be able to send a link to an email address. The link should point to a page allowing the upload of a file.
6. An anonymous user should be able to follow the link to a webpage allowing them to securely upload a file. Once uploaded, the page
should indicate that the file is there (and show it's name), but it should not be downloadable.
