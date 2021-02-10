LIBBOOTKIT_DIR := src/libbootkit

LIBBOOTKIT_SOURCES = \
	$(LIBBOOTKIT_DIR)/libbootkit.c

LIBBOOTKIT_OBJECTS = $(LIBBOOTKIT_SOURCES:.c=.o)

OBJECTS += $(addprefix $(BUILD_PATH)/, $(LIBBOOTKIT_OBJECTS))

include $(LIBBOOTKIT_DIR)/payload/rules.mk

PAYLOAD_HEADER = $(LIBBOOTKIT_DIR)/payload.h
PAYLOAD_NAME = payload

$(PAYLOAD_HEADER): $(PAYLOAD_BIN)
	@bin2c $< $@ $(PAYLOAD_NAME)

libbootkit: $(PAYLOAD_HEADER)
