#!/usr/bin/env ruby

$stdout.print '-> '

$stdin.each_line do |line| 

  pid = fork {
    exec line 
  }

  Process.wait pid

  $stdout.print '-> ' 

end
