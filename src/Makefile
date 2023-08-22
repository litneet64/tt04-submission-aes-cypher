# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

# normal simulation
ifneq ($(GATES),yes)

# this is the only part you should need to modify:
VERILOG_SOURCES += $(PWD)/addRoundKey_tb.v $(PWD)/AES_Encrypt.v $(PWD)/inverseMixColumns.v $(PWD)/inverseSubBytes.v $(PWD)/mixColumns.v $(PWD)/subBytes.v $(PWD)/addRoundKey.v $(PWD)/inverseSbox.v $(PWD)/keyExpansion_tb.v $(PWD)/sbox.v $(PWD)/AES_Decrypt_tb.v $(PWD)/decryptRound.v $(PWD)/inverseShiftRows_tb.v $(PWD)/keyExpansion.v $(PWD)/shiftRows_tb.v $(PWD)/tt_um_AES_tb.v $(PWD)/AES_Decrypt.v $(PWD)/encryptRound.v $(PWD)/inverseShiftRows.v $(PWD)/MakefileshiftRows.v $(PWD)/tt_um_AES.v $(PWD)/AES_Encrypt_tb.v $(PWD)/inverseMixColumns_tb.v $(PWD)/inverseSubBytes_tb.v $(PWD)/mixColumns_tb.v $(PWD)/subBytes_tb.v

else

# gate level simulation requires some extra setup, you shouldn't need to touch this
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/tb.v $(PWD)/gate_level_netlist.v
endif

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
