# Makefile for Portable
#

#
# Program specific options:
#
COMPONENT  = Portable
CLEANTARGET = cleantarget
EXPORTS    = ${EXP_C_H}.${COMPONENT}SWIs
#RESOURCES  = ${RESDIR}.${COMPONENT}.Messages
LIBS       = 
INCLUDES   = 
CDEFINES   = 
OBJS       = \
             o.imp \
             o.portable \
             o.modhead

include CModule

# additional dependencies
$(OZDIR).portable: h.modhead

# Export rules
${EXP_C_H}.${COMPONENT}SWIs: cmhg.modhead
       ${CMHG} ${CMHGFLAGS} -xh $@ cmhg.modhead

cleantarget:
           ${RM} h.modhead

#---------------------------------------------------------------------------
# Dynamic dependencies:
