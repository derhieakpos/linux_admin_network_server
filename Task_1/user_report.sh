#!/bin/env bash

# Report the number of users on the system

# Get the number of logged-in sessions
num_logged_in_sessions=$(w -h | wc -l)

# Get the number of unique logged-in users
num_unique_logged_in_users=$(w -h | awk '{print $1}' | sort | uniq | wc -l)

# Get the total number of users in /etc/passwd
num_users=$(cat /etc/passwd | wc -l)

# Get the amount of free disk space
free_disk_space=$(df -h / | awk 'NR==2 {print $4}')

# Display the report
echo "----------------------------------"
echo "       User Report"
echo "----------------------------------"
echo "Number of logged-in sessions:       $num_logged_in_sessions"
echo "Number of unique logged-in users:   $num_unique_logged_in_users"
echo "Total number of users in /etc/passwd: $num_users"
echo "Free disk space available:          $free_disk_space"
echo "----------------------------------"