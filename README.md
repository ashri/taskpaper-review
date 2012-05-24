Taskpaper Review
================

Taskpaper Review is a Ruby script which examines a [Taskpaper][1] file to update the due dates
and remove unneeded @today and @due items after the tasks have been completed.

The rules
---------

It follows these rules:

  1. A line marked with @due(day name) should be updated to the next date of that day
  2. A line marked with @done and a (@due or @today) should remove the due annotation
  3. A line marked with @today should be set to @overdue
  4. A line marked with @tomorrow should be set to @today
  5. A line marked with @due(date) where the date is tomorrow should be set to @tomorrow
  6. A line marked with @due(date) where the date is today should be set to @today

Usage
-----

To use the file, call the script like:

  `tp-review <taskpaper-file>`

This will overwrite the Taskpaper file with the revised changes.

Alternatively, tp-review takes two optional parameters when running:

  `tp-review <taskpaper-file> [<yyyy-mm-dd>] [--debug]`

The date instructs the script to use the specified date rather than todays
date.

The debug flag means don't overwrite the file, just output debug log and write
the changes to standard out.

Using day to day
----------------

The method I am using it to store my Taskpaper files in Dropbox and everynight
have a cron job call this script to reivew the tasks in the files.

[1]: http://www.hogbaysoftware.com/products/taskpaper
