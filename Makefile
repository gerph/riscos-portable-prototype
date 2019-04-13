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
oz.imp: c.imp C:h.swis C:h.kernel h.modhead C:h.kernel h.portable h.PortableVars
oz.portable: c.portable h.modhead C:h.kernel C:h.swis h.Portable h.PortableVars h.imp h.Portable h.PortableVars C:h.kernel C:riscos.h.services C:riscos.h.events
