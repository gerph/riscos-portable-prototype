# Portable module prototype code

## Summary

This repository holds prototype code suitable for use in building a
RISC OS **Portable** module. The **Portable** module provides control
for the power management and system control functions on portable
devices, together with monitoring of the charging and battery management
functions.

## Background

During the Select development one of the longer term goals was to allow
for portable devices to be used once the hardware became available and
viable for general use. The failed Netbook project had shown that not
only was RISC OS not ready to be ported to such devices, but much of
the functionality within the OS for portable systems had not aged well.

Improvements were made within the OS for some of the areas that would
matter. The most obvious of these were improved network address management
for roaming, improved performance when idling or performing common
operations, interfaces for improved interactive system notifications,
and input improvements such as touch screen and hot key support.

As part of the power management work, it was recognised that whilst there
was documentation of how the Portable module worked, it had not been
updated to reflect the more modern versions of the RISC OS Portable module,
as had been used on the Stork. Additionally, the only implementation of
the Portable module was written in assembler, and tightly coupled to the
hardware.

Documentation was created from the Portable module chapter in the PRM
and updated with the new details.

A new prototype or skeleton module was created which could be delivered
to developer when they needed to create such a module, which
had been written in C with the intention that it be easy to customise
to the developer's hardware.

No new assembler modules were being written for RISC OS at this time,
and providing a C prototype meant that the development time for a given
project would be greatly reduced.

These components would make up a small Software Development Kit (SDK)
for anyone needing it. As the uptake of the prior PNG SDK had been low,
the SDK was not completed to the point of release, and the module was
left in a state that it could be completed relatively easily should
the need arise. The SDK, like the PNG SDK, would have been released
under a permissive license, much as Acorns example and base code had
been.


## Portable module SDK

This repository contains some of what that SDK would have contained.
It comprises:

* Documentation for the Portable module, within the `prminxml/portable.xml`
  and `prminxml/portable.html` files.
* Source code suitable for building a prototype module which can be
  modified by developers.

It is released under the permissive MIT license here to make its reuse
easier, as was the original intent.

## Source code

The C source is supplied in two parts - a general part (`c/portable`),
and an implementation-specific part (`c/impl`). The intent is that the
general part not need to be updated much for any given hardware
implementation. The implementation-specific part, however, contains
stub implementations of the interfaces which have been abstracted from
the RISC OS interfacing.

Each function within the implementation-specific code contains a comment
describing what operations the function should perform, and some dummy
return values which allow the module to report values similar to the
RiscPC hardware. The implementation of these functions should be replaced
by suitable code which communicates with the hardware on the device
that the module is intended for.

It is expected that developers be familiar with the Portable chapter
from the PRM, which is supplied within this repository.


## Automated build

This module uses the RISC OS build system to build the module on each
commit of the code.


## Failings

As the SDK was not complete there are still some failings...

* *Testing*: The build of the module does not contain any specific test code, other
  than to build and load the module to check that it does not crash on
  initialisation. Test code would be required for given hardware, but
  this is obviously also not required.
* *MessageTrans*: The module does not perform MessageTrans translations
  of the error messages.
* *Updated interfaces*: The documentation and the module have not been
  updated to reflect the developments that have happened since 2003.
  As 19 years have elapsed, the current implementation of the Portable
  module will have expanded as such devices are now more accessible.

These failings may be addressed in the future. Pull requests are gratefully
received.
