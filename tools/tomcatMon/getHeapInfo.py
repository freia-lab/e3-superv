import time
import requests
import sys
import json

from TomcatMonitor import TomcatMonitor
import sys
import json

from TomcatMonitor import TomcatMonitor

def main():
    print('*** Heap memory data for tomcat on freia-dbwr.physics.uu.se ***')
    tMon = TomcatMonitor("http://freia-dbwr.physics.uu.se:8080")
    tMon.debug = 0
    runTest(tMon)
    print('*** Heap memory data for tomcat on freia.physics.uu.se ***')
    tMon = TomcatMonitor("http://freia.physics.uu.se:8080")
    tMon.debug = 0
    runTest(tMon)

def runTest(tMon):
    if (tMon.baseAddress is None):
        return
    mused = int(tMon.getHeapMemUsed())
    mmax = int(tMon.getHeapMemMax())
    print ('Heap memory used:\t%12d' %  mused, end=' ')
    if (mused > 0) and (mmax > 0):
        musedPerc = mused/mmax*100
        print ('(%3.1f' % musedPerc +'%)')
    print ('Heap memory Max:\t%12d' % mmax)
    print ('Heap memory Init:\t%12d' % int(tMon.getHeapMemInit()))
    print ('Heap memory Committed:\t%12d' %  int(tMon.getHeapMemCommitted()))
    return


if __name__ == "__main__":
    main()
