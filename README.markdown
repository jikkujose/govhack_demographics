# Participant Demographics for Blockchain GovHack, Dubai

Simple visualization on Google Maps from Slack data.

## Instructions

You need to get an API token from Slack to get this working. If you are a member of the Slack group you can get it by visiting their [API page][slack_api_docs]. The token must then be pasted into a file `.env` to be placed at the root of the directory. The contents should be of the form:

`TOKEN='<the-token-from-slack>'`

Then follow the following step to get the dependencies installed:

* Fork the repo
* Clone the forked repo
* Install Ruby >2.2
* Install required libraries by running: `bundle install`
* Run `rake update` to initiate an update on the data & push to your repo

[slack_api_docs]: https://api.slack.com/docs/oauth-test-tokens
