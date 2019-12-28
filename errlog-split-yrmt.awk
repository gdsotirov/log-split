# Split Apache HTTPD erorr log by year and month
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# Error log format is defined by ErrorLogFormat directive
# (see https://httpd.apache.org/docs/2.4/mod/core.html#errorlogformat),
# which by default is
#   [%t] [%l] [pid %P] %F: %E: [client %a] %M"
# where %t is the timestamp formatted as
#   [DDD MMM DD HH:MM:SS.FFFFFF YYYY]
# so it's necessary to get 2nd field separated by square brackets.
# Then year is 5th and month is 2nd field separated by space (or
# in some cases multiple spaces).
#

BEGIN {
  FS="[][]"
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
  split($2, dat, " *");
  if ( FILENAME == "-" )
    LOG_FNAME = "error_log"
  else
    LOG_FNAME = FILENAME
  if ( dat[5] != 0 && dat[2] != 0 )
    fn = sprintf("%s-%d%02d", LOG_FNAME, dat[5], months[dat[2]])

  print > fn
}

