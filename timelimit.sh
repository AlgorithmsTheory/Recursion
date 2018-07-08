#!/bin/bash

echo -e ":l /var/www/html/recursion.hs \n $1" | /usr/bin/ghci &
sleep 1
kill $! 2>/dev/null && echo "ghci BOOM"
