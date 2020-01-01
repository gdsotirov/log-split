# Split Rsync log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# The default log format of Rsync is as follows (see rsyncd.conf(5) or
# https://download.samba.org/pub/rsync/rsyncd.conf.html)
#   %t %p %o %h [%a] %m (%u) %f %l
# with the timestamp %t being the 1st field separated by space, formatted as
#   YYYY/MM/DD HH:MM:SS
# so year is 1st field spearated by slash.
#

{
  split($1, dat, "/")
  if ( FILENAME == "-" )
    LOG_FNAME = "rsync.log"
  else
    LOG_FNAME = FILENAME
  if ( dat[1] > pryr )
    fn = sprintf("%s-%d", LOG_FNAME, dat[1])

  print > fn
  pryr = dat[1]
}

