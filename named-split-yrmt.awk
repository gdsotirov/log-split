# Split ISC Bind NAMED log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# ISC Bind NAMED writes timestamps in the form
#   DD-MMM-YYYY HH:MM:SS.FFF
# so year and month are in the first field split by spaces.
# Then year is 3rd and month is 2nd field split by dash.
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
  split($1, dat, "-")
  if ( FILENAME == "-" )
    LOG_FNAME = "named.log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%02d", LOG_FNAME, dat[3], months[dat[2]])

  print > fn
}

