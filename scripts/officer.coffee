# Description:
#   Some chatops to help out the Big Data officers
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   PASSWORDS
#
# Commands:
#   hubot pwd-me - panzy
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   rzhade3

String.prototype.format = ->
  args = arguments
  return this.replace /{(\d+)}/g, (match, number) ->
    return if typeof args[number] isnt 'undefined' then args[number] else match

module.exports = (robot) ->
  robot.respond /pwd-me (.*)/i, (res) ->
    role = 'admin'
    username = res.message.user.name
    user = robot.brain.userForName(username)
    return res.reply "#{name} does not exist" unless user?

    unless robot.auth.hasRole(user, role)
      res.reply "Access Denied. You need role #{role} to perform this action."
      return

    pwdType = res.match[1].toUpperCase()
    fmt = "Username: {0} Password: {1}"
    msg = switch pwdType
      when "GOOGLE" then fmt.format(process.env.GOOGLE_USERNAME, process.env.GOOGLE_PASSWORD)
      when "TWITTER" then fmt.format(process.env.TWITTER_USERNAME, process.env.TWITTER_PASSWORD)
      when "DOCKER" then fmt.format(process.env.DOCKER_USERNAME, process.env.DOCKER_PASSWORD)
      when "HEROKU" then fmt.format(process.env.HEROKU_USERNAME, process.env.HEROKU_PASSWORD)
      else "Invalid User Account"

    room = robot.adapter.client.rtm.dataStore.getDMByName username
    robot.messageRoom room.id, msg

    return
