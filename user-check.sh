#!/bin/bash

echo "=============================="
echo "      USER INFORMATION        "
echo "=============================="
echo ""
echo "Currently logged in users:"
who
echo ""
echo "Total users on system:"
cat /etc/passwd | grep -v nologin | grep -v false | wc -l
echo ""
echo "Last 5 logins:"
last -n 5
echo ""
echo "=============================="
