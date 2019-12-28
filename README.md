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
