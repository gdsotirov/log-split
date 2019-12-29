# Split ISC Bind NAMED log by year
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# ISC Bind NAMED writes timestamps in the form
#   DD-MMM-YYYY HH:MM:SS.FFF
# so year and month are in the first field split by spaces.
# Then year is 3rd and month is 2nd field split by dash.
#

{
  split($1, dat, "-")
  if ( FILENAME == "-" )
    LOG_FNAME = "named.log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d", LOG_FNAME, dat[3])

  print > fn
}

