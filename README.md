# Kele API Client

### REST API Client

Easy-to-use Gem to access [Bloc's API](http://docs.blocapi.apiary.io/#)

[Demo Site](https://blocipedia-kasey.herokuapp.com)

## Project Objectives

- Retrieves and stores an authentication token when using valid credentials
- Students can retrieve their info as a JSON blob
- Students can retrieve a list of their mentor's availability
- Students can retrieve roadmaps and checkpoints
- Students can retrieve a list of their messages, respond to an existing message, and create a new message thread
- Students can submit checkpoint assignments

## Setup and Configuration

### Setup

...

### Getting started

Require kele Gem on irb:

    require 'kele'

 And that's it! Kele is ready to party.

To start, create a new variable using your Bloc's email and password. Kele will securely post your credentials to Bloc's API for an authentication token!

    kele_client = Kele.new('student@bloc.com', 'SecretPassword')

### Retrieving user info

On irb, use `get_me` method

    kele_client.get_me

Kele will convert the JSON returned from the API into a Ruby Hash containing information about the user.

### Getting Mentor Availability


    kele_client.get_mentor_availability(mentor_id)


It will return a ruby array of mentor's available time.

### Checking Roadmaps and Checkpoints

With `roadmap_id` and `checkpoint_id`, user can retrieve associated Bloc's roadmap and checkpoint information using `get_roadmap(roadmap_id)` and `get_checkpoint(checkpoint_id)`, respectively

    kele_client.get_roadmap(roadmap_id)
    kele_client.get_checkpoint(checkpoint_id)


### Retrieving and sending messages

Kele can retrieve all message in history using `get_messages` method. If given an argument `page`, `get_messages(page)` will return message thread page `page` (message thread is pagninated with 10 messages per page); `get_messages` without argument will return all messages.

    kele_client.get_messages

Kele can create messages using `create_messages(sender, recipient_id,  subject, stripped_text, token)` whereas subject is message subject and stripped is message's content.

    kele_client.create_messages(sender, recipient_id,  subject, stripped_text, token)

### Submitting Checkpoints

Kele can create new Bloc checkpoint submission on Bloc using `create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)`

    kele_client.create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
