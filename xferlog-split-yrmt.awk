# Split ProFTPD FPD transfer log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# ProFTPD daemon's transfer log is configured with TransferLog directive
# in proftpd.conf (see http://www.proftpd.org/docs/directives/linked/config_ref_TransferLog.html)
# The timestamp has the format
# DDD MMM DD HH:MM:SS YYYY
# so year is 5th and month is 2nd field separated by spaces.
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
  if ( FILENAME == "-" )
    LOG_FNAME = "xferlog"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%02d", LOG_FNAME, $5, months[$2])
  print > fn
}

