# Split Apache HTTPD access log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# Access log format is defined by CustomLog directive
# (see https://httpd.apache.org/docs/2.4/mod/mod_log_config.html#customlog)
# which normally is
#   %h %l %u %t \"%r\" %>s %b
# where %t is the timestamp formatted as
#   [DD/MMM/YYYY:HH:MM:SS +ZZZZ]
# so it's necessary to get 4th field separated by space.
# Then year is 3rd field separated by slash or colon.
#

{
  split($4, dat, "[:/]");
  if ( FILENAME == "-" )
    LOG_FNAME = "access_log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d", LOG_FNAME, dat[3])

  print > fn
}

