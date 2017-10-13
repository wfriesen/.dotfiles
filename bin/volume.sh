#!/bin/bash

vol=$(amixer get Master | awk '/%/ {if ($6 == "[off]") { print "MM"; exit } else { gsub(/\[|\]/, ""); print $5; exit }}')

echo $vol

exit 0
