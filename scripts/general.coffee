# Description:
#  General scripts for club members
#
# Dependencies:
#
#
# Configuration:
#
#
# Commands:
#   hubot info - Returns information about Big Data Club
#
# Notes:
#
#
# Author:
#   rzhade3

module.exports = (robot) ->

  robot.respond /info/i, (res) ->
    res.send "For general information about the club, check out our " +
      "website at gtbigdata.club, or our Facebook page at " +
      "facebook.com/gtbigdataclub" +
      "\n\n" +
      "We are active on Social Media!\n" +
      "*Facebook:* facebook.com/gtbigdataclub\n" +
      "*GitHub:* github.com/gt-big-data\n" +
      "*Twitter:* twitter.com/gtbigdataclub\n" +
      "*Instagram:* instagram.com/gtbigdata/" +
      "\n\n" +
      "Other Useful Links\n" +
      "*Google Drive:* goo.gl/n3aYVu\n" +
      "*Slack:* bigdataclub.slack.com\n" +
      "*Wiki:* github.com/gt-big-data/wiki/wiki"
