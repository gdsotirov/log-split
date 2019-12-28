# HTTP Log Split

Scripts for splitting HTTPD logs by year and/or month.

# Usage

For splitting a single access_log into files by year use the command:

```awk -f acclog-split-yr.awk access_log```

For splitting a single access_log into files by year and month use the command:

```awk -f acclog-split-yrmt.awk access_log```

For splitting a single error_log into files by year use the command:

```awk -f errlog-split-yr.awk error_log```

For splitting a single error_log into files by year and month use the command:

```awk -f errlog-split-yrmt.awk error_log```

For splitting a single ssl_request_log into files by year use the command:

```awk -f ssllog-split-yr.awk ssl_request_log```

For splitting a single ssl_request_log into files by year and month use the command:

```awk -f ssllog-split-yrmt.awk ssl_request_log```

# Performance

Splitting a large file (e.g. several GB or TB) could take significant amount
of time. Consider for example, that splitting a file of 10 GB with an
Intel(R) Pentium(R) G3420 @ 3.20GHz CPU on a WD Gold 4TB hard drive takes
about 4 minutes.

