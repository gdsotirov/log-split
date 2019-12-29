# Log split

Scripts for splitting large logs files by year and/or month.

# Usage

The scripts could be used for the log files of various daemons.

## Apache HTTPD

For splitting a single `access_log` into files by year use the command:

```awk -f acclog-split-yr.awk access_log```

For splitting a single `access_log` into files by year and month use
the command:

```awk -f acclog-split-yrmt.awk access_log```

For splitting a single `error_log` into files by year use the command:

```awk -f errlog-split-yr.awk error_log```

For splitting a single `error_log` into files by year and month use
the command:

```awk -f errlog-split-yrmt.awk error_log```

For splitting a single `ssl_request_log` into files by year use the command:

```awk -f ssllog-split-yr.awk ssl_request_log```

For splitting a single `ssl_request_log` into files by year and month use
the command:

```awk -f ssllog-split-yrmt.awk ssl_request_log```

## ProFTPD FTPD

For splitting a single `proftpd.log` or `tls.log` into files by year use
the command:

```awk -f ftpd-split-yr.awk proftpd.log```

For splitting a single `proftpd.log` or `tls.log` into files by year and
month use the command:

```awk -f ftpd-split-yrmt.awk proftpd.log```

For splitting a single `xferlog` into files by year use the command:

```awk -f xferlog-split-yr.awk xferlog```

For splitting a single `xferlog` into files by year and month use
the command:

```awk -f xferlog-split-yrmt.awk xferlog```

## Net-SNMP SNMPD

For splitting a single `snmpd.log` into files by year use the command:

```awk -f snmpd-split-yr.awk snmpd.log```

For splitting a single `snmpd.log` into files by year and month use
the command:

```awk -f snmpd-split-yrmt.awk snmpd.log```

## ISC Bind NAMED

For splitting a single `named.log` into files by year use the command:

```awk -f named-split-yr.awk named.log```

For splitting a single `named.log` into files by year and month use
the command:

```awk -f named-split-yrmt.awk named.log```

# Performance

Splitting a large file (e.g. several GB or TB) could take **significant**
amount of time! Consider for example, that splitting an `access_log` of 10 GB
with an Intel(R) Pentium(R) G3420 @ 3.20GHz CPU on a WD Gold 4TB hard drive
takes about **4 minutes**.

