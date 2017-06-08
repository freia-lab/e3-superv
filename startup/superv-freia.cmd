#require snmp
#require autosave
epicsEnvSet("AUTOSAVE_SYSM_PV_PREFIX","superv:")
epicsEnvSet("MIBDIRS", "+$(REQUIRE_ioc_superv_freia_PATH)/misc")
epicsEnvSet("D", "UCD-SNMP-MIB::")
epicsEnvSet("W", "SNMPv2-MIB::")
epicsEnvSet("N", "NOTIFICATION-LOG-MIB::")

epicsEnvSet("HOST_1" "$(SUPERV_FREIA_1=192.168.10.60)")
epicsEnvSet("HOST_2" "$(SUPERV_FREIA_2=192.168.10.62)")
epicsEnvSet("HOST_3" "$(SUPERV_FREIA_3=192.168.10.64)")
epicsEnvSet("HOST_4" "$(SUPERV_FREIA_4=192.168.10.107)")
epicsEnvSet("HOST_5" "$(SUPERV_FREIA_5=192.168.10.108)")
epicsEnvSet("HOST_6" "$(SUPERV_FREIA_6=130.238.199.246)")

devSnmpSetSnmpVersion($(HOST_1),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_2),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_3),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_4),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_5),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_6),SNMP_VERSION_2c)

#devSnmpSetParam("DebugLevel",10)

# HOST_1 (freia-srv1)
dbLoadRecords("diskTable.template","P=Ctrl-freiaSrv1,PART=disk-root,PASSWD=freia_secret,H=$(HOST_1),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-freiaSrv1,PART=disk-data1,PASSWD=freia_secret,H=$(HOST_1),CHAN=7,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-freiaSrv1,PASSWD=freia_secret,H=$(HOST_1)")

# HOST_2 (centos-srv1)
dbLoadRecords("diskTable.template","P=Ctrl-centosSrv1,PART=disk-root,PASSWD=freia_secret,H=$(HOST_2),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-centosSrv1,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_2),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-centosSrv1,PART=disk-data1,PASSWD=freia_secret,H=$(HOST_2),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-centosSrv1,PASSWD=freia_secret,H=$(HOST_2)")

# HOST_3 (freia-arcapl1)
dbLoadRecords("diskTable.template","P=Ctrl-arcApl1,PART=disk-root,PASSWD=freia_secret,H=$(HOST_3),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-arcApl1,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_3),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-arcApl1,PART=disk-data1,PASSWD=freia_secret,H=$(HOST_3),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-arcApl1,PASSWD=freia_secret,H=$(HOST_3)")

# HOST_4 (vm-codac-1)
dbLoadRecords("diskTable.template","P=Ctrl-vmCodac1,PART=disk-root,PASSWD=freia_secret,H=$(HOST_4),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-vmCodac1,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_4),CHAN=2,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-vmCodac1,PASSWD=freia_secret,H=$(HOST_4)")

# HOST_5 (freia-arch1)
dbLoadRecords("diskTable.template","P=Ctrl-freiaArch1,PART=disk-root,PASSWD=freia_secret,H=$(HOST_5),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-freiaArch1,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_5),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-freiaArch1,PART=disk-data1,PASSWD=freia_secret,H=$(HOST_5),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-freiaArch1,PASSWD=freia_secret,H=$(HOST_5)")

# HOST_6 (freia.physics.uu.se)
dbLoadRecords("diskTable.template","P=Ctrl-freia,PART=disk-root,PASSWD=freia_secret,H=$(HOST_6),CHAN=1,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-freia,PASSWD=freia_secret,H=$(HOST_6)")

# FREIA general status
dbLoadRecords("freia-status.db")

requireSnippet(superv-freia-preSaveRestore.cmd)

#############################################
## IOC initialization                      ##
#############################################
iocInit

requireSnippet(superv-freia-postSaveRestore.cmd)
