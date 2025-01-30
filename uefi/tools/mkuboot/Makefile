BINARY = mkuboot

BUILD = yes

BINPLACE = tools/bin

BINARYTYPE = build

INCLUDES += $(SRCROOT)/os/uefi/include;

VPATH += $(SRCROOT)/os/uefi/core

OBJS = mkuboot.o \
       crc32.o   \

include $(SRCROOT)/os/ka09.mk
