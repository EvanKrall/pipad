#!/usr/bin/python3

from smbus2 import SMBus

with SMBus(1) as bus:
    regs = [bus.read_byte_data(0x6a, addr) for addr in range(0x00, 0x14+1)]


def bit(reg_num, bit_num):
    return (regs[reg_num] >> bit_num) & 0x01

def bitrange(reg_num, high_bit, low_bit):
    reg = regs[reg_num]
    mask = (2<<(high_bit - low_bit)) - 1
    return (reg >> low_bit) & mask


def print_variable(name, reg_num, high_bit, low_bit=None, conv=None):
    if low_bit is None:
        low_bit = high_bit
    bits = bitrange(reg_num, high_bit, low_bit)
    length = high_bit - low_bit + 1
    bitstr = f"{bits:0{length}b}"
    if conv:
        try:
            # try first as a list/dict
            converted = conv[bits]
        except TypeError:
            # if that fails, try as a function.
            converted = conv(bits)
    else:
        converted = ""
    print(f"{name:>15}:   {bitstr:>8}   {converted}")


def endis(desc):
    return [f"Disable {desc}", f"Enable {desc}"]


print_variable("REG00", 0x00, 7, 0)
print_variable("EN_HIZ", 0x00, 7, conv=endis("HIZ mode"))
print_variable("EN_ILIM", 0x00, 6, conv=endis("ILIM Pin"))
print_variable("IINLIM", 0x00, 5, 0, conv=lambda x: f"{x*50 + 100}mA")

print_variable("REG01", 0x01, 7, 0)
print_variable("BHOT", 0x01, 7, 6, conv=["34.75%", "37.75%", "31.25%", "Disable boost mode thermal protection"])
print_variable("BCOLD", 0x01, 5, conv=["77%", "80%"])
print_variable("VINDPM_OS", 0x01, 4, 0, conv=lambda x: f"{x*0.1}V")

print_variable("REG02", 0x02, 7, 0)
print_variable("CONV_START", 0x02, 7, conv=["ADC conversion not active", "Start ADC Conversion"])
print_variable("CONV_RATE", 0x02, 6, conv=["One shot ADC conversion", "Start 1s Continuous Conversion"])
print_variable("BOOST_FREQ", 0x02, 5, conv=["1.5MHz", "500kHz"])
print_variable("ICO_EN", 0x02, 4, conv=endis("ICO Algorithm"))
print_variable("HVDCP_EN", 0x02, 3, conv=endis("HVDCP handshake"))
print_variable("MAXC_EN", 0x02, 2, conv=endis("MaxCharge handshake"))
print_variable("FORCE_DPDM", 0x02, 1, conv=["Not in D+/D- or PSEL detection", "Force D+/D- detection"])
print_variable("AUTO_DPDM_EN", 0x02, 0, conv=endis("D+/D- or PSEL detection when VBUS is plugged-in"))

print_variable("REG03", 0x03, 7, 0)
print_variable("BAT_LOADEN", 0x03, 7, conv=endis("Battery load (I_BATLOAD)"))
print_variable("WD_RST", 0x03, 6, conv=["Normal", "Reset"])
print_variable("OTG_CONFIG", 0x03, 5, conv=endis("OTG"))
print_variable("CHG_CONFIG", 0x03, 4, conv=endis("Charging"))
print_variable("SYS_MIN", 0x03, 3, 1, conv=lambda x: f"{x*0.1 + 3.0}V")
print_variable("reserved", 0x03, 0)

print_variable("REG04", 0x04, 7, 0)
print_variable("EN_PUMPX", 0x04, 7, conv=endis("Current pulse control (PUMPX_UP and PUMPX_DN)"))
print_variable("ICHG", 0x04, 6, 0, conv=lambda x: f"{x*64}mA")

print_variable("REG05", 0x05, 7, 0)
print_variable("IPRECHG", 0x05, 7, 4, conv=lambda x: f"{x*64 + 64}mA")
print_variable("ITERM", 0x05, 3, 0, conv=lambda x: f"{x*64 + 64}mA")

print_variable("REG06", 0x06, 7, 0)
print_variable("VREG", 0x06, 7, 2, conv=lambda x: f"{x*0.016 + 3.840}V")
print_variable("BATLOWV", 0x06, 1, conv=["2.8V", "3.0V"])
print_variable("VRECHG", 0x06, 0, conv=["100mV below VREG", "200mV below VREG"])

print_variable("REG07", 0x07, 7, 0)
print_variable("EN_TERM", 0x07, 7, conv=endis("Charging Termination"))
print_variable("STAT_DIS", 0x07, 6, conv=["Enable STAT pin function", "Disable STAT pin function"])
print_variable("WATCHDOG", 0x07, 5,4, conv=["Disable watchdog timer", "40s", "80s", "160s"])
print_variable("EN_TIMER", 0x07, 3, conv=endis("Charging Safety Timer"))
print_variable("CHG_TIMER", 0x07, 2,1, conv=["5 hrs", "8 hrs", "12 hrs", "20 hrs"])
print_variable("reserved", 0x07, 0)

print_variable("REG08", 0x08, 7, 0)
print_variable("BAT_COMP", 0x08, 7,5, conv=lambda x: f"{x*20}mΩ")
print_variable("VCLAMP", 0x08, 4,2, conv=lambda x: f"{x*32}mV above VREG")
print_variable("TREG", 0x08, 1,0, conv=["60C", "80C", "100C", "120C"])

print_variable("REG09", 0x09, 7, 0)
print_variable("FORCE_ICO", 0x09, 7, conv=["Do not force ICO", "Force ICO"])
print_variable("TMR2X_EN", 0x09, 6, conv=["Safety timer not slowed by 2X during input DPM or thermal regulation", "Safety timer slowed by 2X during input DPM or thermal regulation"])
print_variable("BATFET_DIS", 0x09, 5, conv=["Allow BATFET turn on", "Force BATFET off"])
print_variable("reserved", 0x09, 4)
print_variable("BATFET_DLY", 0x09, 3, conv=["BATFET turn off immediately when BATFET_DIS bit is set", "BATFET turn off delay by t_SM_DLY when BATFET_DIS bit is set"])
print_variable("BATFET_RST_EN", 0x09, 2, conv=endis("BATFET full system reset"))
print_variable("PUMPX_UP", 0x09, 1, conv=endis("Current pulse control voltage up"))
print_variable("PUMPX_DN", 0x09, 0, conv=endis("Current pulse control voltage down"))

print_variable("REG0A", 0x0a, 7, 0)
print_variable("BOOSTV", 0x0a, 7,4, conv=lambda x: f"{(x*0.064 + 4.55):.3f}V")
print_variable("Reserved", 0x0a, 3,0)

print_variable("REG0B", 0x0b, 7, 0)
print_variable("VBUS_STAT", 0x0b, 7, 5, conv=lambda x: [
        "No Input",
        "USB Host SDP",
        "USB CDP (1.5A)",
        "USB DCP (3.25A)",
        "Adjustable High Voltage DCP (MaxCharge) (1.5A)",
        "Unknown Adapter (500mA)",
        "Non-Standard Adapter (1A/2A/2.1A/2.4A)",
        "OTG",
    ][x],
)
print_variable("CHRG_STAT", 0x0b, 4,3, conv=["Not Charging", "Pre-charge (< V_BATLOWV)", "Fast Charging", "Charge Termination Done"])
print_variable("PG_STAT", 0x0b, 2, conv=lambda x: "Power Good" if x else "Not Power Good")
print_variable("SDP_STAT", 0x0b, 1, conv=lambda x: "USB500 input is detected" if x else "USB100 input is detected")
print_variable("VSYS_STAT", 0x0b, 0, conv=lambda x: "In VSYSMIN regulation (BAT < VSYSMIN)" if x else "Not in VSYSMIN regulation (BAT > VSYSMIN)")

print_variable("REG0C", 0x0c, 7, 0)
print_variable("WATCHDOG_FAULT", 0x0c, 7, conv=["Normal", "Watchdog timer expiration"])
print_variable("BOOST_FAULT", 0x0c, 6, conv=lambda x: "VBUS overloaded in OTG, or VBUS OVP, or battery is too low in boost mode" if x else "Normal")
print_variable("CHRG_FAULT", 0x0c, 5,4, conv=["Normal", "Input fault (VBUS > V_ACOV or VBAT < VBUS < V_VBUSMIN(typical 3.8V))", "Thermal shutdown", "Charge Safety Timer Expiration"])
print_variable("BAT_FAULT", 0x0c, 3, conv=["Normal", "BATOVP"])
print_variable("NTC_FAULT", 0x0c, 2,0, conv={
        0b000: "Normal",
        0b001: "TS Cold (Buck mode)",
        0b010: "TS Hot (Buck mode)",
        0b101: "TS Cold (Boost mode)",
        0b110: "TS Hot (Boost mode)",
    },
)

print_variable("REG0D", 0x0D, 7, 0)
print_variable("FORCE_VINDPM", 0x0d, 7, conv=["Run Relative VINDPM Threshold", "Run Absolute VINDPM Threshold"])
print_variable("VINDPM", 0x0d, 6,0, conv=lambda x: f"{0.1 * x + 2.6}V")

print_variable("REG0E", 0x0E, 7, 0)
print_variable("THERM_STAT", 0x0e, 7, conv=["Normal", "In Thermal Regulation"])
print_variable("BATV", 0x0e, 6, 0, conv=lambda x: f"{(x*0.02 + 2.304):1.3f}V")

print_variable("REG0F", 0x0F, 7, 0)
print_variable("reserved", 0x0f, 7)
print_variable("SYSV", 0x0f, 6, 0, conv=lambda x: f"{(x*0.02 + 2.304):1.3f}V")

print_variable("REG10", 0x10, 7, 0)
print_variable("reserved", 0x10, 7)
print_variable("TSPCT", 0x10, 6, 0, conv=lambda x: f"{(x * 0.465 + 21):2.3f}% of REGN")

print_variable("REG11", 0x11, 7, 0)
print_variable("VBUS_GD", 0x11, 7, conv=["Not VBUS Attached", "VBUS Attached"])
print_variable("VBUSV", 0x11, 6, 0, conv=lambda x: f"{0.1 * x + 2.6}V")

print_variable("REG12", 0x12, 7, 0)
print_variable("Unused", 0x12, 7)
print_variable("ICHGR", 0x12, 6, 0, conv=lambda x: f"{50 * x}mA")

print_variable("REG13", 0x13, 7, 0)
print_variable("VDPM_STAT", 0x13, 7, conv=["Not in VINDPM", "VINDPM"])
print_variable("IDPM_STAT", 0x13, 6, conv=["Not in IINDPM", "IINDPM"])
print_variable("IDPM_LIM", 0x13, 5,0, conv=lambda x: f"{50 * x + 100}mA")  # error in docs

print_variable("REG14", 0x14, 7, 0)
print_variable("REG_RST", 0x14, 7, conv=["Keep current register setting", "Reset to default register value and reset safety timer"])
print_variable("ICO_OPTIMIZED", 0x14, 6, conv=["Optimization is in progress", "Maximum Input Current Detected"])
print_variable("PN", 0x14, 5,3, conv={0b111: "bq25895"})
print_variable("TS_PROFILE", 0x14, 2, conv=["Cold/Hot"])
print_variable("DEV_REV", 0x14, 1, 0)
