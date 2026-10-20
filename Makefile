CROSS   ?=
AS      = $(CROSS)as
LD      = $(CROSS)ld
ASFLAGS = -g

ifeq ($(CROSS),)
RUNNER  =
else
RUNNER  = qemu-aarch64
endif

SRC     = $(wildcard src/*.s)
OBJ     = $(patsubst src/%.s,build/%.o,$(SRC))
TARGET  = build/ordenamiento

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) -o $@ $^

build/%.o: src/%.s | build
	$(AS) $(ASFLAGS) -o $@ $<

build:
	mkdir -p build

run: $(TARGET)
	$(RUNNER) ./$(TARGET)

clean:
	rm -rf build

.PHONY: all run clean