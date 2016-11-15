#############################################
## Autosave monitor post setup             ##
#############################################

create_monitor_set("ioc-superv-freia.req",30,"P=$(AUTOSAVE_SYSM_PV_PREFIX)")

