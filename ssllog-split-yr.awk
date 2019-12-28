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
# Then year is 3rd field separated by slash or colon.
#

{
  split($1, dat, "[/:]");
  if ( FILENAME == "-" )
    LOG_FNAME = "error_log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d", LOG_FNAME, dat[3])

  print > fn
}

