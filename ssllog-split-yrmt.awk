# Split Apache HTTPD SSL request log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# Error log format is defined by CustomLog directive
# (see https://httpd.apache.org/docs/2.4/mod/mod_log_config.html#customlog),
# which by default is
#   %t %h %{SSL_PROTOCOL}x %{SSL_CIPHER}x \"%r\" %b
# where %t is the timestamp formatted as
#   [DD/MMM/YYYY:HH:MM:SS +ZZZZ]
# so it's necessary to get 1st field separated by space.
# Then year is 3rd field and month is 2nd field separated by slash or colon.
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
  split($1, dat, "[/:]");
  if ( FILENAME == "-" )
    LOG_FNAME = "error_log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%02d", LOG_FNAME, dat[3], months[dat[2]])

  print > fn
}

