# Description:
#   Some attendance scripts
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   ATTENDANCE
#
# Commands:
#   bigdatabot present - Marks the user as attending in the attendance
#
# Notes:
#
#
# Author:
#   rzhade3

module.exports = (robot) ->
  robot.respond /present/i, (res) ->
    email = res.message.user.email_address
    name = res.message.user.slack.profile.real_name

    attendees = robot.brain.get('attendees')
    if attendees.indexOf(email) == -1 # Checking to see if already exists
      attendees.push(email)
    robot.brain.set 'attendees', attendees

    return res.reply "Marked you as attending!"
