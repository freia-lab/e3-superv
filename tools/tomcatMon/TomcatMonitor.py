import time
import requests
import sys
import json


class TomcatMonitor:
    debug = 0
    baseAddress = None

    def __init__(self, baseAddress):
        if self.debug > 0:
            print("Connecting to", baseAddress)
        self.baseAddress = baseAddress

    def put(self, url, data):
        return requests.put(self.baseAddress + url, json =data)
    def post(self, url, data):
        return requests.post(self.baseAddress + url, json =data)
    def get(self, url, params, auth):
        if self.debug > 1:
            print (self.baseAddress + url, params, auth)
        return requests.get(self.baseAddress + url, params = params, auth = auth, timeout=1.50)

    def getHeapMem(self, key):
        params = {"get": "java.lang:type=Memory", "att": "HeapMemoryUsage", "key": key}
        reply = self.get('/manager/jmxproxy', params, ('sysfreia','jmxadm'))
        if self.debug > 0:
            print(reply.status_code)
            print(reply.text)
            for split in reply.text.split():
                print (split)
            print('Value:', reply.text.split()[-1])
        if reply.ok:
            if reply.text.split()[0] == 'OK':
                return reply.text.split()[-1]
            else:
                return -1
        else:
            return -reply.status_code

    def getHeapMemUsed(self):
        return int(self.getHeapMem("used"))/1024

    def getHeapMemMax(self):
        return int(self.getHeapMem("max"))/1024

    def getHeapMemCommitted(self):
        return int(self.getHeapMem("committed"))/1024

    def getHeapMemInit(self):
        return int(self.getHeapMem("init"))/1024

