# Problem

As a company, we need to get various types of files securely from customers. For example, we get periodic insurance claims data. Our customers
don't always have accounts, so they can't login to do the upload. We need a way for "anonymous" users to send us a file in a secure manner.

# Goal
Create a RubyOnRails application that allows an administrator to set up third party secure file uploads.

# Workflow
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

# Implemenation

## Overview

There are two users already in the app

Admin Robot (u:`admin@payload.io` p:`password`) and Frankie Smiley (u:`frank@payload.io` p:`franktest`)

Admin Robot is an admin user. When this user is logged in, one is taken to the admin console
Frankie Smiley is registered admin user.  When this user is logged in, one is taken to a non portion of the app. This was impletented to demonstrate that it is possible for registered non-admin users to interact with the site as well and be delivered their own kind of funcationality.

For the purpose of creating data, Admin Robot must used

1. When a Admin Robot logs in, one immediatly sees a summary of the users created, payloads created, and payloads that have data uploaded to them 
2. when a payload is viewed they see
id: of the payload in the table
uuid: uuid assigned (this way users never see the sequential id from the db)
file:  filename
content_type: mime type of uploaded file
application/pdf
owner_email: email address of the person sent the payload
file_size: size of the file
descr: user inputed description
uploaded_at: date payload was uploaded.  when blank it means there is no uploaded data
user_id: user_id of the admin that created the paylaod
created_at: date payload was created
updated_at: date payload was uploaded
3. CarrierWave is used for file uploads.  Currently files are uploaded as file storage (ie: inside the public folder) however with a minunum amoumt of changes this could easily be uploaded to s3.  As i plan to leave this repo open to the public along with all credentials required for it to run, i found it unwise to put any aws creds in the app
4. When a Admin Robot logs in, one is immedialy presented with a button to create a payload
5. The payload is sent to the specified user immmediatly upon creation of the payload
6. A user receives an email with a link to the payload that should be used to upload the file.  Once the user uploads the file, they are taken to the overview of the file (see #2). there is no download link.  However admins can download the files from the admin console