#include <stdio.h>
#include <dbDefs.h>
#include <subRecord.h>
#include <registryFunction.h>
#include <epicsExport.h>
#include <recGbl.h>

static int getEpochTimeDebug;

static long getEpochTimeInit(struct subRecord *psub)
{
  if (getEpochTimeDebug)
    printf("subInit was called\n");
  return 0;
}

static long getEpochTimeProcess(struct subRecord *psub)
{
  recGblGetTimeStamp(psub);
  psub->val = psub->time.secPastEpoch;
  return 0;
}

/* Register these symbols for use by IOC code: */
epicsExportAddress(int, getEpochTimeDebug);
epicsRegisterFunction(getEpochTimeInit);
epicsRegisterFunction(getEpochTimeProcess);
