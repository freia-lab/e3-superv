# This should be a test or example startup script

epicsEnvSet ("IOCNAME", "ioc09-superv")

# Directory name for the autosave files
epicsEnvSet ("IOCDIR", "superv")

require superv
require autosave
require recsync

iocshLoad("$(superv_DIR)/superv-common.iocsh")


#devSnmpSetParam("DebugLevel",10)

# HOST_1 (freia-srv1)
iocshLoad("$(superv_DIR)/computer-2p.iocsh","IP_ADDR=192.168.10.60,P=Ctrl-freiaSrv1,PART1=disk-root,PART2=disk-data1,CH2=7")

# HOST_2 (centos-srv1)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=192.168.10.62,P=Ctrl-centosSrv1,PART1=disk-root,PART2=disk-boot,PART3=disk-data1")

# HOST_3 (freia-arcapl1)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=130.238.200.137,P=Ctrl-arcApl1,PART1=disk-root,PART2=disk-boot,PART3=disk-data1")

# HOST_4 (centos7-dm)
iocshLoad("$(superv_DIR)/computer-2p.iocsh","IP_ADDR=192.168.10.107,P=Ctrl-centos7DM,PART1=disk-root,PART2=disk-boot")

# HOST_5 (freia-arch1)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=192.168.10.108,P=Ctrl-freiaArch1,PART1=disk-root,PART2=disk-boot,PART3=disk-data1")

# HOST_6 (freia.physics.uu.se)
iocshLoad("$(superv_DIR)/computer-1p.iocsh","IP_ADDR=130.238.4.140,P=Ctrl-freia,PART1=disk-root")

# HOST_7 (centos-srv2)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=192.168.10.70,P=Ctrl-centosSrv2,PART1=disk-root,PART2=disk-boot,PART3=disk-home")

# HOST_8 (nuc-04)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=192.168.10.118,P=Ctrl-nuc04,PART1=disk-root,PART2=disk-boot,PART3=disk-home")

# HOST_9 (freia-cons2)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=192.168.10.114,P=Ctrl-freiaCons2,PART1=disk-root,PART2=disk-boot,PART3=disk-home")

# HOST_10 (nuc-07)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=192.168.10.126,P=Ctrl-nuc07,PART1=disk-root,PART2=disk-boot,PART3=disk-home")

# HOST_11 (oldpc-01)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=192.168.10.204,P=Ctrl-oldpc01,PART1=disk-root,PART2=disk-boot,PART3=disk-home")

# HOST_12 (oldpc-02)
iocshLoad("$(superv_DIR)/computer-3p.iocsh","IP_ADDR=192.168.10.205,P=Ctrl-oldpc02,PART1=disk-root,PART2=disk-boot,PART3=disk-home")

# HOST_13 (freia-dbwr.physics.uu.se)
iocshLoad("$(superv_DIR)/computer-2p.iocsh","IP_ADDR=130.238.200.135,P=Ctrl-freiaDbwr,PART1=disk-root,PART2=disk-boot")

# HOST_14 (vsr01.freia.local)
iocshLoad("$(superv_DIR)/computer-1p.iocsh","IP_ADDR=192.168.10.102,P=Ctrl-vsrv01,PART1=disk-root")

iocshLoad("$(autosave_DIR)/autosave.iocsh", "AS_TOP=/opt/epics/autosave,IOCNAME=$(IOCNAME)")
#iocshLoad("$(recsync_DIR)/recsync.iocsh", "IOCNAME=$(IOCNAME)")
