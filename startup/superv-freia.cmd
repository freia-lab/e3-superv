require snmp
epicsEnvSet("AUTOSAVE_SYSM_PV_PREFIX","superv:")
epicsEnvSet("MIBDIRS", "+$(REQUIRE_ioc_superv_freia_PATH)/misc")
epicsEnvSet("D", "UCD-SNMP-MIB::")
epicsEnvSet("W", "SNMPv2-MIB::")
epicsEnvSet("N", "NOTIFICATION-LOG-MIB::")

epicsEnvSet("IPADDR1", $(HOST_1))
devSnmpSetSnmpVersion($(HOST_1),SNMP_VERSION_1)

#devSnmpSetParam("DebugLevel",10)

dbLoadRecords("superv-freia.db","H=$(HOST_1)"

#requireSnippet(dbToLoad-superv-freia.cmd, "H_IPADDR=$(HOST_1)")

#############################################
## IOC initialization                      ##
#############################################
iocInit
