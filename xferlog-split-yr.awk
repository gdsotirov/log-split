# Split ProFTPD FPD transfer log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# ProFTPD daemon's transfer log is configured with TransferLog directive
# in proftpd.conf (see http://www.proftpd.org/docs/directives/linked/config_ref_TransferLog.html)
# The timestamp has the format
# DDD MMM DD HH:MM:SS YYYY
# so year is 5th field separated by spaces.
#

{
  if ( FILENAME == "-" )
    LOG_FNAME = "xferlog"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d", LOG_FNAME, $5)
  print > fn
}

