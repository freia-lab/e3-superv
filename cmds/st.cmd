# This should be a test or example startup script

epicsEnvSet ("IOCNAME", "ioc09-superv")

# Directory name for the autosave files
epicsEnvSet ("IOCDIR", "superv")

require superv
require autosave
require recsync

#epicsEnvSet("MIBDIRS", "+$(REQUIRE_ioc_superv_freia_PATH)/misc")
epicsEnvSet("D", "UCD-SNMP-MIB::")
epicsEnvSet("W", "SNMPv2-MIB::")
epicsEnvSet("N", "NOTIFICATION-LOG-MIB::")

epicsEnvSet("HOST_1" "$(SUPERV_FREIA_1=192.168.10.60)")
epicsEnvSet("HOST_2" "$(SUPERV_FREIA_2=192.168.10.62)")
epicsEnvSet("HOST_3" "$(SUPERV_FREIA_3=130.238.200.137)")
epicsEnvSet("HOST_4" "$(SUPERV_FREIA_4=192.168.10.107)")
epicsEnvSet("HOST_5" "$(SUPERV_FREIA_5=192.168.10.108)")
epicsEnvSet("HOST_6" "$(SUPERV_FREIA_6=130.238.4.140)")
epicsEnvSet("HOST_7" "$(SUPERV_FREIA_7=192.168.10.70)")
epicsEnvSet("HOST_8" "$(SUPERV_FREIA_8=192.168.10.118)")
epicsEnvSet("HOST_9" "$(SUPERV_FREIA_9=192.168.10.114)")
epicsEnvSet("HOST_10" "$(SUPERV_FREIA_10=192.168.10.126)")
epicsEnvSet("HOST_11" "$(SUPERV_FREIA_11=192.168.10.204)")
epicsEnvSet("HOST_12" "$(SUPERV_FREIA_12=192.168.10.205)")
epicsEnvSet("HOST_13" "$(SUPERV_FREIA_13=130.238.200.135)")
epicsEnvSet("HOST_14" "$(SUPERV_FREIA_14=192.168.10.102)")

devSnmpSetSnmpVersion($(HOST_1),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_2),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_3),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_4),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_5),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_6),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_7),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_8),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_9),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_10),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_11),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_12),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_13),SNMP_VERSION_2c)
devSnmpSetSnmpVersion($(HOST_14),SNMP_VERSION_2c)

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

# HOST_4 (centos7-dm)
dbLoadRecords("diskTable.template","P=Ctrl-centos7DM,PART=disk-root,PASSWD=freia_secret,H=$(HOST_4),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-centos7DM,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_4),CHAN=2,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-centos7DM,PASSWD=freia_secret,H=$(HOST_4)")

# HOST_5 (freia-arch1)
dbLoadRecords("diskTable.template","P=Ctrl-freiaArch1,PART=disk-root,PASSWD=freia_secret,H=$(HOST_5),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-freiaArch1,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_5),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-freiaArch1,PART=disk-data1,PASSWD=freia_secret,H=$(HOST_5),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-freiaArch1,PASSWD=freia_secret,H=$(HOST_5)")

# HOST_6 (freia.physics.uu.se)
dbLoadRecords("diskTable.template","P=Ctrl-freia,PART=disk-root,PASSWD=freia_secret,H=$(HOST_6),CHAN=1,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-freia,PASSWD=freia_secret,H=$(HOST_6)")

# HOST_7 (centos-srv2)
dbLoadRecords("diskTable.template","P=Ctrl-centosSrv2,PART=disk-root,PASSWD=freia_secret,H=$(HOST_7),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-centosSrv2,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_7),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-centosSrv2,PART=disk-home,PASSWD=freia_secret,H=$(HOST_7),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-centosSrv2,PASSWD=freia_secret,H=$(HOST_7)")

# HOST_8 (nuc-04)
dbLoadRecords("diskTable.template","P=Ctrl-nuc04,PART=disk-root,PASSWD=freia_secret,H=$(HOST_8),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-nuc04,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_8),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-nuc04,PART=disk-home,PASSWD=freia_secret,H=$(HOST_8),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-nuc04,PASSWD=freia_secret,H=$(HOST_8)")

# HOST_9 (freia-cons2)
dbLoadRecords("diskTable.template","P=Ctrl-freiaCons2,PART=disk-root,PASSWD=freia_secret,H=$(HOST_9),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-freiaCons2,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_9),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-freiaCons2,PART=disk-home,PASSWD=freia_secret,H=$(HOST_9),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-freiaCons2,PASSWD=freia_secret,H=$(HOST_9)")

# HOST_10 (nuc-07)
dbLoadRecords("diskTable.template","P=Ctrl-nuc07,PART=disk-root,PASSWD=freia_secret,H=$(HOST_10),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-nuc07,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_10),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-nuc07,PART=disk-home,PASSWD=freia_secret,H=$(HOST_10),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-nuc07,PASSWD=freia_secret,H=$(HOST_10)")

# HOST_11 (oldpc-01)
dbLoadRecords("diskTable.template","P=Ctrl-oldpc01,PART=disk-root,PASSWD=freia_secret,H=$(HOST_11),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-oldpc01,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_11),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-oldpc01,PART=disk-home,PASSWD=freia_secret,H=$(HOST_11),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-oldpc01,PASSWD=freia_secret,H=$(HOST_11)")

# HOST_12 (oldpc-02)
dbLoadRecords("diskTable.template","P=Ctrl-oldpc02,PART=disk-root,PASSWD=freia_secret,H=$(HOST_12),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-oldpc02,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_12),CHAN=2,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-oldpc02,PART=disk-home,PASSWD=freia_secret,H=$(HOST_12),CHAN=3,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-oldpc02,PASSWD=freia_secret,H=$(HOST_12)")

# HOST_13 (freia-dbwr.physics.uu.se)
dbLoadRecords("diskTable.template","P=Ctrl-freiaDbwr,PART=disk-root,PASSWD=freia_secret,H=$(HOST_13),CHAN=1,HI=85,HH=95")
dbLoadRecords("diskTable.template","P=Ctrl-freiaDbwr,PART=disk-boot,PASSWD=freia_secret,H=$(HOST_13),CHAN=2,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-freiaDbwr,PASSWD=freia_secret,H=$(HOST_13)")

# HOST_14 (vsr01.freia.local)
dbLoadRecords("diskTable.template","P=Ctrl-vsrv01,PART=disk-root,PASSWD=freia_secret,H=$(HOST_14),CHAN=1,HI=85,HH=95")
dbLoadRecords("hostSuperv.template","P=Ctrl-vsrv01,PASSWD=freia_secret,H=$(HOST_14)")

# FREIA general status and NUC's ram disk usage
dbLoadRecords("freia-status.db","HI=70,HH=90")

# FREIA PVs set by the alarm server
dbLoadRecords("freia-sevrpv.db")

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME)")
#iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")
