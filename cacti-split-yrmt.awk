# Split Cacti log by year and month
# Written by Georgi D. Sotirov <gdsotirov@gmail.com>
#
# Different versions of cacti wrote timestamps as
#   DD/MM/YYYY HH:MM:SS [AM|PM]
# or as
#   YYYY-MM-DD HH:MM:SS
# or as
#   YYYY/MM/DD HH:MM:SS
# so all three need to be matched. In all cases date is in the 1st field
# separated by space.
# In frist case year is 3rd and months is 2nd field separated by slash.
# In second and third cases year is 1st and months is 2nd field separated by
# dash or slash.
#

/^[0-9]{2}\/[0-9]{2}\/[0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2} (AM|PM)?/ {
  split($1, dat, "/");
  if ( FILENAME == "-" )
    LOG_FNAME = "access_log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%02d", LOG_FNAME, dat[3], dat[2])
  print > fn
}
/^[0-9]{4}\-[0-9]{2}\-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/ {
  split($1, dat, "-");
  if ( FILENAME == "-" )
    LOG_FNAME = "access_log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%02d", LOG_FNAME, dat[1], dat[2])
  print > fn
}
/^[0-9]{4}\/[0-9]{2}\/[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/ {
  split($1, dat, "/");
  if ( FILENAME == "-" )
    LOG_FNAME = "access_log"
  else
    LOG_FNAME = FILENAME
  fn = sprintf("%s-%d%02d", LOG_FNAME, dat[1], dat[2])
  print > fn
}

