

##
## Check for the necessary environment variables.
##

ifndef SRCROOT
$(error Error: Environment not set up: SRCROOT environment variable missing)
endif

ifndef ARCH
$(error Error: Environment not set up: ARCH environment variable missing)
endif

ifndef DEBUG
$(error Error: Environment not set up: DEBUG environment variable missing)
endif

LIBRARIES = lib          \

COMPONENTS = apps        \
             boot        \
             drivers     \
             kernel      \
             uefi        \

DIRS = $(LIBRARIES)      \
       $(COMPONENTS)     \
       images

include $(SRCROOT)/os/ka09.mk

images: $(COMPONENTS)
$(COMPONENTS): $(LIBRARIES)

##
## Boot and UEFI need KD from the kernel (which could be moved out to a
## library). Drivers and apps (which may also build some drivers) link against
## the kernel.
##

boot drivers apps uefi: kernel

##
## Boot relies on UEFI for the elfconv tool.
##

boot: uefi

