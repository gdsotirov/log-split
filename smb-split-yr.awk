# Split Rsync log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# Samba writes logs with single timestamp over serveral lines, so
# only those lines should change log file name.
# Timestamp is written in square brackets and has the form
#   YYYY/MM/DD HH:MM:SS
# So year is 1st and month is 2nd field separated by slash.
#

BEGIN {
  FS = "[][]"
  fn = "samba.log-0000"
}
/^\[[0-9]{4}\/[0-9]{2}\/[0-9]{2}/ {
  split($2, dat, "/")
  if ( FILENAME == "-" )
    LOG_FNAME = "samba.log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d", LOG_FNAME, dat[1])
}
{
  print > fn
}