require snmp
epicsEnvSet("AUTOSAVE_SYSM_PV_PREFIX","superv:")
epicsEnvSet("MIBDIRS", "+$(REQUIRE_ioc_superv_freia_PATH)/misc")
epicsEnvSet("D", "UCD-SNMP-MIB::")
epicsEnvSet("W", "SNMPv2-MIB::")
epicsEnvSet("N", "NOTIFICATION-LOG-MIB::")

epicsEnvSet("HOST_1" "$(SUPERV_FREIA_1=192.168.10.99)")

devSnmpSetSnmpVersion($(HOST_1),SNMP_VERSION_2c)

#devSnmpSetParam("DebugLevel",10)

# HOST_1 
dbLoadRecords("diskTable.template","P=Ctrl-freiavm2,PART=disk-root,PASSWD=freia_secret,H=$(HOST_1),CHAN=1")
dbLoadRecords("hostSuperv.template","P=Ctrl-freiavm2,PASSWD=freia_secret,H=$(HOST_1)")

#requireSnippet(dbToLoad-superv-freia.cmd, "H_IPADDR=$(HOST_1)")

#############################################
## IOC initialization                      ##
#############################################
iocInit
