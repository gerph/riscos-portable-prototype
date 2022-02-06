# Makefile for Portable
#

#
# Program specific options:
#
COMPONENT  = Portable
CLEANTARGET = cleantarget
EXPORTS    = ${EXP_C_H}.${COMPONENT}SWIs \
			 ${EXP_C_H}.${COMPONENT}Vars \
			 ${EXP_HDR}.${COMPONENT}
#RESOURCES  = ${RESDIR}.${COMPONENT}.Messages
LIBS       = 
INCLUDES   = 
CDEFINES   = 
OBJS       = \
             o.impl \
             o.portable \
             o.modhead

include CModule

# additional dependencies
$(OZDIR).portable: h.modhead

# Export rules
${EXP_C_H}.${COMPONENT}SWIs: cmhg.modhead
       	${CMHG} ${CMHGFLAGS} -xh $@ cmhg.modhead
${EXP_HDR}.${COMPONENT}: hdr.Portable
		${CP} $? $@ ${CPFLAGS}
${EXP_C_H}.${COMPONENT}Vars: h.PortableVars
		${CP} $? $@ ${CPFLAGS}


cleantarget:
           ${RM} h.modhead

#---------------------------------------------------------------------------
# Dynamic dependencies:
