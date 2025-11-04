# This should be a test or example startup script

epicsEnvSet ("PYTHONDONTWRITEBYTECODE" , "1")

epicsEnvSet ("IOCNAME", "MJsuperv")

# Directory name for the autosave files
epicsEnvSet ("IOCDIR", "superv")

require superv
#require autosave
require recsync

require linstat

iocshLoad("$(superv_DIR)/superv-common.iocsh")

# from linstat
epicsEnvSet("ENGINEER", "MJ")
dbLoadRecords("linStatHost.db","IOC=ioc99-test")
dbLoadRecords("linStatProc.db","IOC=ioc99-test")
dbLoadRecords("linStatNIC.db","IOC=ioc99-test,NIC=lo")
dbLoadRecords("linStatFS.db","P=ioc99-test:ROOT,DIR=/")

dbLoadRecords("linStatNIC.db","IOC=ioc99-test,NIC=enp86s0")


#devSnmpSetParam("DebugLevel",10)

# HOST_14 (vsr01.freia.local)
# iocshLoad("$(superv_DIR)/computer-1p.iocsh","IP_ADDR=192.168.10.102,P=MJCtrl-vsrv01,PART1=disk-root")

#iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME)")
##iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")

#iocshLoad("$(superv_DIR)/tomcat-mon.iocsh", "IP_ADDR=http://freia-dbwr.physics.uu.se:8080,P=Ctrl-freiaDbwr:tomcat-,PDEV=dbwr")
#iocshLoad("$(superv_DIR)/tomcat-mon.iocsh", "IP_ADDR=http://freia.physics.uu.se:8080,P=Ctrl-freia:tomcat-,PDEV=freia")
