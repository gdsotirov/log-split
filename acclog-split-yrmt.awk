# Split Apache HTTPD access log by month and year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# Access log format is defined by CustomLog directive
# (see https://httpd.apache.org/docs/2.4/mod/mod_log_config.html#customlog)
# which normally is
#   %h %l %u %t \"%r\" %>s %b
# where %t is the timestamp formatted as
#   [DD/MMM/YYYY:HH:MM:SS +ZZZZ]
# so it's necessary to get 4th field separated by space.
# Then year is 3rd field and month is 2nd field separated by slash or dots.
#

BEGIN {
  months["Jan"] = 1
  months["Feb"] = 2
  months["Mar"] = 3
  months["Apr"] = 4
  months["May"] = 5
  months["Jun"] = 6
  months["Jul"] = 7
  months["Aug"] = 8
  months["Sep"] = 9
  months["Oct"] = 10
  months["Nov"] = 11
  months["Dec"] = 12
}
{
  split($4, dat, "[:/]");
  if ( FILENAME == "-" )
    LOG_FNAME = "access_log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%02d", LOG_FNAME, dat[3], months[dat[2]])

  print > fn
}

