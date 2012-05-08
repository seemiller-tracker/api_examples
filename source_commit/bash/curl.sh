#!/usr/bin/env bash

TOKEN='5aa5987654321189df33d2d123456789' # Enter your token!

STORY_ID=29219585

MESSAGE="[#$STORY_ID] commit message from CURL"
AUTHOR="me@example.com"
URL="http://example.com/curl"
REVISION="1234"  # Increment me, duplicate commits do not show up in the story!

curl -H "X-TrackerToken: $TOKEN" -X POST -H "Content-type: application/xml" \
    -d "<source_commit><message>$MESSAGE</message><author>$AUTHOR</author><commit_id>$REVISION</commit_id><url>$URL</url></source_commit>" \
    http://www.pivotaltracker.com/services/v3/source_commits
