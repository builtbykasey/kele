# Kele API Client

### REST API Client

Easy-to-use Gem to access [Bloc's API](http://docs.blocapi.apiary.io/#)

See a demo version here: https://blocipedia-kasey.herokuapp.com

This app was created as part of the [Bloc Full Stack Web Development apprenticeship program](https://www.bloc.io/web-developer-career-track).

## Project Objectives

- Users can initialize and authorize Kele with a Bloc username and password
- Users can retrieve the current user as a JSON blob
- Users can retrieve a list of my mentor's availability
- Users can retrieve roadmaps and checkpoints
- Users can retrieve a list of my messages, respond to an existing message, and create a new message thread
- Users can submit checkpoint assignments

## Setup and Configuration

### Getting started with Kele Gem

Require kele Gem on irb:

    require 'kele'

 And that's it! Kele is ready to party.

To start, create a new variable using your Bloc's email and password. Kele will securely post your credentials to Bloc's API for a super awesome authentication token!

    kele_client = Kele.new('myAwesomeEmail@bloc.com', 'mySuperSecretPassword')

### Retrieving user info

On irb, use `get_me` method

    kele_client.get_me

Kele will return [json](https://en.wikipedia.org/wiki/JSON) type file about the user.

### Getting Mentor Availability

Kele can retrieve Bloc mentor's available time should you want to check their schedule, given their mentor_id with `get_mentor_availability(mentor_id)`

    kele_client.get_mentor_availability(1234567)


It will return a ruby array of mentor's available time in [Zulu Time](https://en.wikipedia.org/wiki/Coordinated_Universal_Time#Time_zones)

### Checking Roadmaps and Checkpoints

By knowing `roadmap_id` and `checkpoint_id`, user can retrieve associated Bloc's roadmap and checkpoint information using `get_roadmap(roadmap_id)` and `get_checkpoint(checkpoint_id)`, respectively

    roadmap_id = 123
    checkpoint_id = 123
    kele_client.get_roadmap(roadmap_id)
    kele_client.get_checkpoint(checkpoint_id)


### Retrieving and sending messages

Kele can retrieve all message in history using `get_messages` method. If given an argument `num`, `get_messages(num)` will return message thread page `num` (message thread is pagninated with 10 messages per page); `get_messages` without argument will return all messages.

    kele_client.get_messages

Kele can create messages using `create_messages(user_id, recipient_id, subject, stripped)` whereas subject is message subject and stripped is message's content.

    kele_client.create_messages(123,321,"Hullo!","This is the first message sent using Kele. Awesome!!")

### Submitting Checkpoints

Kele can create new Bloc checkpoint submission on Bloc using `create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)`

    kele_client.create_submission(123,"part1-create-submission", "https://github.com/IggHub/kele/commit/12345abc...", "Final submission for Kele project - awesome!" )

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
