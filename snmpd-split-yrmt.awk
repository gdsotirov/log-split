# Split Net-SNMP SNMPD log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# In order for the log to be timestamped, please add the following
# to snmpd.conf:
#
# [snmp]
# logTimestamp true
#
# See https://sourceforge.net/p/net-snmp/mailman/message/13273785/
# 
# The timestamp has the form
# YYYY-MM-DD HH:MM:SS
# so it's easy to get the first field by space.
# Then year is 1rd and month is 2nd field separated by dash.
#

{
  split($1, dat, "-");
  if ( FILENAME == "-" )
    LOG_FNAME = "snmpd.log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%d", LOG_FNAME, dat[1], dat[2])

  print > fn
}

