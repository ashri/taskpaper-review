#!/usr/bin/env ruby

require 'fileutils'
require 'tempfile'

def replace_day_names(line)
  line
end

def mark_due_today(line)
  line
end

def mark_overdue(line)
  line
end

def cleanup_done(line)
  line
end

# The Taskpaper file is the argument provided
task_file = ARGV.first
puts "Taks file: #{task_file}"

debug = ARGV[1] == "--debug"

# Ensure the file actually exists that we are going to edit
unless FileTest.exists?(task_file)
  puts "File to review was not found (#{task_file})" if debug
  exit 1
end

# Create a temporary file to record the changes
temp_file = Tempfile.new("#{task_file.split('/').last}")
puts "Temporary file: #{temp_file.path}" if debug

# Scan each line of the Task file
File.open(task_file).each_line do |line|

  # for each line check if it needs to be processed
  puts "Processing: #{line}" if debug

  # A line marked with @due(day name) should be updated to the next date of that day
  line = replace_day_names(line)
  # A line marked with a @due(date) where the date is today should be set to @today
  line = mark_due_today(line)
  # A line marked with a @due(date) where the date is overdue should be set to @overdue
  line = mark_overdue(line)
  # A line marked with @done and a (@due or @today) should remove the due annotation
  line = cleanup_done(line)

  # Write reviewed line into temporary file
  puts "Cleaned line: #{line}" if debug
  temp_file.write line

end

temp_file.rewind
puts "Temp File: " if debug
puts temp_file.read
temp_file.close

# Move the temporary file over the original file
unless debug
  FileUtils.mv(temp_file.path, task_file)
else
  FileUtils.mv(temp_file.path, "#{task_file}.debug")
end
