EXCLUDE_ARCHS += eldk

include $(EPICS_ENV_PATH)/module.Makefile

OPIS = opi
MISCS += misc/ioc-superv-freia.req
