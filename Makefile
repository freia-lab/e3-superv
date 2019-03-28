EXCLUDE_ARCHS += eldk
EXCLUDE_VERSIONS = 3.14

include $(EPICS_ENV_PATH)/module.Makefile

USR_DEPENDENCIES += snmp
USR_DEPENDENCIES += autosave

OPIS = opi
MISCS += misc/ioc-superv-freia.req
