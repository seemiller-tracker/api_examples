#!/usr/bin/env ruby

require 'net/http'
require 'uri'

tracker_token = '5aa5987654321189df33d2d123456789' # Enter your token!
story_id = 29219591
author = 'me@example.com' # Enter your tracker username or email!
commit_id = '3456' # Increment me, duplicate commits do not show up in the story!

json_string = <<JSON
    {
      "source_commit":
        {
          "url": "http://example.com/json",
          "message": "[##{story_id}] commit message from JSON",
          "author": "#{author}",
          "commit_id" : "#{commit_id}"
        }
    }
JSON

path = '/services/v3/source_commits'

@http = Net::HTTP.new('www.pivotaltracker.com', 80)
@http.set_debug_output $stderr

@headers = {
  'X-TrackerToken' => tracker_token,
  'Content-type' => 'application/json'
}

resp, data = @http.post(path, json_string, @headers)

puts 'Code = ' + resp.code
puts 'Message = ' + resp.message
resp.each {|key, val| puts key + ' = ' + val}
puts data
