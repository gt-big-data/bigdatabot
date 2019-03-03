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
#   bigdatabot im here - Marks the user as attending in the attendance
#
# Notes:
#
#
# Author:
#   rzhade3

module.exports = (robot) ->
  robot.respond /im here/i, (res) ->
    email = res.message.user.profile.email
    username = res.message.user.name

    attendees = robot.brain.get('attendees')
    if array.indexof(email) == -1
      attendees.push(email)
    robot.brain.set 'attendees', attendees

    return
