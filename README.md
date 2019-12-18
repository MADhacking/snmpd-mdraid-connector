snmpd-mdraid-connector
======================

![shellcheck](https://github.com/MADhacking/snmpd-mdraid-connector/workflows/Shellcheck/badge.svg) ![tests](https://github.com/MADhacking/snmpd-mdraid-connector/workflows/Ebuild%20Tests/badge.svg) [![coverage](https://codecov.io/gh/MADhacking/snmpd-mdraid-connector/branch/master/graph/badge.svg)](https://codecov.io/gh/MADhacking/snmpd-mdraid-connector)

Unfortunately, neither the net-analyzer/net-snmp or sys-fs/mdadm packages provide a suitable SNMPD extension script to enable the SNMP daemon to access MD-RAID array state data.

The snmp-agents/snmpd-mdraid-connector package aims to rectify this by providing an SNMPD extension script and a helper script which together enable the SNMP daemon to be used to remotely monitor the health and sate of MD-RAID devices. Available information includes Array Path, Metadata Version, Array UUID, RAID Level, RAID Layout, and Chunk Size. Boolean indicators allowing the monitoring of Health State, Has Failed Components and Has Available Spares are also included. Finally, gauges representing Total Components, Active Components, Failed Components and Spare Components are provided. 

More information may be found at:

http://www.mad-hacking.net/software/linux/agnostic/snmpd-mdraid-connector/index.xml
