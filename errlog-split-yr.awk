# Split Apache HTTPD erorr log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# Error log format is defined by ErrorLogFormat directive
# (see https://httpd.apache.org/docs/2.4/mod/core.html#errorlogformat),
# which by default is
#   [%t] [%l] [pid %P] %F: %E: [client %a] %M"
# where %t is the timestamp formatted as
#   [DDD MMM DD HH:MM:SS.FFFFFF YYYY]
# so it's necessary to get 2nd field separated by square brackets.
# Then year is 5th field separated by space (or in some cases multiple
# spaces).
#

BEGIN {
  FS="[][]"
}
{
  split($2, dat, " *");
  if ( FILENAME == "-" )
    LOG_FNAME = "error_log"
  else
    LOG_FNAME = FILENAME
  if ( dat[5] != 0 )
    fn = sprintf("%s-%d", LOG_FNAME, dat[5])

  print > fn
}

