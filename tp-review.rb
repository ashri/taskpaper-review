#!/usr/bin/env ruby

# The Taskpaper file is the argument provided
task_file = ARGV.first
puts "Taks file: #{task_file}"

# Scan each line of the Task file

# for each line check if it needs to be processed

# A line marked with @due(day name) should be updated to the next date of that day

# A line marked with a @due(date) where the date is today should be set to @today
#
# A line marked with a @due(date) where the date is overdue should be set to @overdue

# A line marked with @done and a (@due or @today) should remove the due annotation


# Save the file

