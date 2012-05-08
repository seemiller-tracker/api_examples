#!/usr/bin/env ruby

require 'net/http'
require 'uri'

tracker_token = '5aa5987654321189df33d2d123456789' # Enter your token!
story_id = 29219587
author = 'me@example.com'  # Enter your tracker username or email!
commit_id = '2345' # Increment me, duplicate commits do not show up in the story!

xml_string = <<XML
  <source_commit>
    <message>[##{story_id}] commit message from XML</message>
    <author>#{author}</author>
    <commit_id>#{commit_id}</commit_id>
  </source_commit>
XML

path = '/services/v3/source_commits'

@http = Net::HTTP.new('www.pivotaltracker.com', 80)
@http.set_debug_output $stderr

@headers = {
  'X-TrackerToken' => tracker_token,
  'Content-type' => 'application/xml'
}

resp, data = @http.post(path, xml_string, @headers)

puts 'Code = ' + resp.code
puts 'Message = ' + resp.message
resp.each {|key, val| puts key + ' = ' + val}
puts data
