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
/PHP Warning: +Variable passed to each\(\) is not an array or object in/ {
  split($2, dat, " *");
  iso_dat = dat[5] "-" dat[2] "-" dat[3]
  if ( !similar[iso_dat] ) {
    print > fn # print similar message first occurance
  }
  similar[iso_dat]++
  prevsim = $0
}
!/PHP Warning: +Variable passed to each\(\) is not an array or object in/ {
  if ( prevsim != "" ) {
    split(prevsim, prdat, "[] *]")
    priso = prdat[5] "-" prdat[2] "-" prdat[3]
    #print "Similar(" _ priso _ "): " _ similar[priso]
    if ( similar[priso] ) {
      # print similar message last occurence and count
      if ( similar[priso] > 2 ) {
        print " skipped " _ similar[priso] - 2 _ " similar messages" > fn
      }
      print prevsim > fn
      similar[priso] = 0
      prevsim = ""
    }
  }
  split($2, dat, " *");
  if ( FILENAME == "-" )
    LOG_FNAME = "error_log"
  else
    LOG_FNAME = FILENAME
  if ( dat[5] != 0 )
    fn = sprintf("%s-%d", LOG_FNAME, dat[5])

  print > fn
}

