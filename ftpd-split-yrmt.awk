# Split ProFTPD FPD system log by year and month
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# ProFTPD daemon's system log is configured with SystemLog directive
# in proftpd.conf (see http://www.proftpd.org/docs/directives/linked/config_ref_SystemLog.html)
# In ProFTPd 1.3.4e and earlier had timestamp formatted as
#   MMM DD HH:MM:SS
# (i.e. no year), so it's necessary to specify start year and then
# flip year following change from another month to Jan.
# Since 1.3.5b and newer the timestamp is
#   YYYY-MM-DD HH:MM:SS,FFF
# which is easier for parsing and splitting.
#

BEGIN {
  STARTYR = 2006
  logyr = STARTYR
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
# ProFTPD 1.3.4e and earlier
/^(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) [0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/ {
  if ( FILENAME == "-" )
    LOG_FNAME = "proftpd.log"
  else
    LOG_FNAME = FILENAME
  if ( $1 == "Jan" && prevmon != "Jan" ) { # flip year on month change
    logyr++
  }
  fn = sprintf("%s-%d%02d", LOG_FNAME, logyr, months[$1])
  print > fn
  prevmon = $1
}
# ProFTPD 1.3.5b and later
/^[0-9]{4}\-[0-9]{2}\-[0-9]{2} +[0-9]{2}:[0-9]{2}:[0-9]{2}/ {
  split($1, dat, "-")
  if ( FILENAME == "-" )
    LOG_FNAME = "proftpd.log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%02d", LOG_FNAME, dat[1], dat[2])
  print > fn
}

