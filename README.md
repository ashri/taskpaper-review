Taskpaper Review
================

Taskpaper Review is a Ruby script which examines a Taskpaper file to update the due dates
and remove unneeded @today and @due items after the tasks have been completed.

The rules
---------

It follows these rules:

  1. A line marked with @due(day name) should be updated to the next date of
     that days occurance
  2. A line marked with a @due(date) where the date is today should be set to
     @today
  3. A line marked with a @due(date) where the date is overdue should be set to
     @overdue
  4. A line marked with @done and a (@due or @today) should remove the due
     annotation

Usage
-----

To use the file, call the script like:

  tp-review.rb <taskpaper-file>

The method I am using it to store my Taskpaper files in Dropbox and everynight
have a cron job call this script to update the tasks in the files.

