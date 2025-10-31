import time
import requests
import sys
import json

from ArcaplMonitor import ArcaplMonitor
import sys
import json

def main():
    print('*** AA metrics on freia-arcapl1.physics.uu.se ***')
    aa = ArcaplMonitor("http://freia-arcapl1.physics.uu.se:17665/mgmt/bpl/getApplianceMetrics")
    aa.debug = 0
    runTest(aa)
    print('*** AA metrics on freia-arcapl2.physics.uu.se ***')
    aa = ArcaplMonitor("http://freia-arcapl2.physics.uu.se:17665/mgmt/bpl/getApplianceMetrics")
    aa.debug = 1
    runTest(aa)
    print('*** AA metrics on freia-arcapl3.physics.uu.se ***')
    aa = ArcaplMonitor("http://freia-arcapl3.physics.uu.se:17665/mgmt/bpl/getApplianceMetrics")
    aa.debug = 0
    runTest(aa)
    print('*** AA metrics on oldpc-01.freia.local ***')
    aa = ArcaplMonitor("http://oldpc-01.freia.local:17665/mgmt/bpl/getApplianceMetrics")
    aa.debug = 0
    runTest(aa)

def runTest(aa):
    if (aa.url is None):
        return
    print ('Status :\t\t\t%s' %  aa.getStatus())
    conPVs = aa.getConnectedPVCount()
    print ('Connected PV count:\t%12d' %  conPVs, end=' ')
    print ('of total %d' %  aa.getPvCount())
    print ('Disconnected PVs:\t%12d' % aa.getDisconnectedPVCount())
    print ('Event rate [1/s] :\t\t%.2f' %  aa.getEventRate())
    print ('Data rate [byte/s] :\t\t%.2f' %  aa.getDataRate())
    print ('Total ETL runs (0->1) :\t%12d' %  aa.getTotalETLRuns0())
    print ('Total ETL runs (1->2) :\t%12d' %  aa.getTotalETLRuns1())
    print ('Average time spent in ETL (0->1):\t%.2f' % aa.getAvgTimeETL0())
    print ('Average time spent in ETL (1->2):\t%.2f' % aa.getAvgTimeETL0())
    print ('Time spent in writing to STS:\t%.2f' % aa.getSecondsConsumedByWriter())
    
    return


if __name__ == "__main__":
    main()
