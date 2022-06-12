import re


def sign_expand_16(imm):
    zeros = ""
    if len(imm) < 16:
        for i in range(16 - len(imm)):
            zeros = zeros + "0"
        imm = zeros + imm
    return imm


def sign_expand_5(imm):
    zeros = ""
    if len(imm) < 5:
        for i in range(5 - len(imm)):
            zeros = zeros + "0"
        imm = zeros + imm
    return imm


def binary_to_hex(binary):
    binary = binary.replace('_', '')
    hexstr = ""
    if len(binary) % 4 != 0:
        raise Exception("Binary length must be multiple of 4")
    else:
        for i in range(0, len(binary), 4):
            hex1 = hex(int(binary[i: i + 4], 2))[2:]
            hexstr = hexstr + hex1
        return hexstr


def hex_to_binary(hexstr):
    binary = bin(int(hexstr, 16))[2:]
    return binary


def get_lines(file_name):
    instractions = []
    with open(file_name, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if line.find("//"):
                line = line[:line.find("//")]
            line = line.strip()
            if line != '\n' and line != '' and line.find('//') == -1:
                instractions.append(line)
    return instractions



def write_verilog(file_name, verilogs):
    with open(file_name, 'w+') as f:
        for i in verilogs:
            f.write(i)
            f.write("\n")



def compilation(instractions):
    verilog = []
    i = 0
    for instraction in instractions:
        verilogstr = ""
        if re.match("lui R(\d+),0x(\d{4})", instraction):
            reg = re.search("lui R(\d+),0x(\d{4})", instraction).groups()[0]
            imm = re.search("lui R(\d+),0x(\d{4})", instraction).groups()[1]
            ins = "001111_00000" + sign_expand_5(hex_to_binary(reg)) + "_" + sign_expand_16(hex_to_binary(imm))
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif re.match("add R(\d+),R(\d+),R(\d+)", instraction):
            reg1 = re.search("add R(\d+),R(\d+),R(\d+)", instraction).groups()[0]
            reg2 = re.search("add R(\d+),R(\d+),R(\d+)", instraction).groups()[1]
            reg3 = re.search("add R(\d+),R(\d+),R(\d+)", instraction).groups()[2]
            ins = "000000" + "_" + sign_expand_5(hex_to_binary(reg2)) + sign_expand_5(hex_to_binary(reg3)) \
                  + sign_expand_5(hex_to_binary(reg1)) + "_" + "00000" + "100000"
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif re.match("sub R(\d+),R(\d+),R(\d+)", instraction):
            reg1 = re.search("sub R(\d+),R(\d+),R(\d+)", instraction).groups()[0]
            reg2 = re.search("sub R(\d+),R(\d+),R(\d+)", instraction).groups()[1]
            reg3 = re.search("sub R(\d+),R(\d+),R(\d+)", instraction).groups()[2]
            ins = "000000" + "_" + sign_expand_5(hex_to_binary(reg2)) + sign_expand_5(hex_to_binary(reg3)) \
                  + sign_expand_5(hex_to_binary(reg1)) + "_" + "00000" + "100010"
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif re.match("and R(\d+),R(\d+),R(\d+)", instraction):
            reg1 = re.search("and R(\d+),R(\d+),R(\d+)", instraction).groups()[0]
            reg2 = re.search("and R(\d+),R(\d+),R(\d+)", instraction).groups()[1]
            reg3 = re.search("and R(\d+),R(\d+),R(\d+)", instraction).groups()[2]
            ins = "000000" + "_" + sign_expand_5(hex_to_binary(reg2)) + sign_expand_5(hex_to_binary(reg3)) \
                  + sign_expand_5(hex_to_binary(reg1)) + "_" + "00000" + "100100"
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif re.match("or R(\d+),R(\d+),R(\d+)", instraction):
            reg1 = re.search("or R(\d+),R(\d+),R(\d+)", instraction).groups()[0]
            reg2 = re.search("or R(\d+),R(\d+),R(\d+)", instraction).groups()[1]
            reg3 = re.search("or R(\d+),R(\d+),R(\d+)", instraction).groups()[2]
            ins = "000000" + "_" + sign_expand_5(hex_to_binary(reg2)) + sign_expand_5(hex_to_binary(reg3)) \
                  + sign_expand_5(hex_to_binary(reg1)) + "_" + "00000" + "100101"
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif re.match("xor R(\d+),R(\d+),R(\d+)", instraction):
            reg1 = re.search("xor R(\d+),R(\d+),R(\d+)", instraction).groups()[0]
            reg2 = re.search("xor R(\d+),R(\d+),R(\d+)", instraction).groups()[1]
            reg3 = re.search("xor R(\d+),R(\d+),R(\d+)", instraction).groups()[2]
            ins = "000000" + "_" + sign_expand_5(hex_to_binary(reg2)) + sign_expand_5(hex_to_binary(reg3)) \
                  + sign_expand_5(hex_to_binary(reg1)) + "_" + "00000" + "100110"
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif re.match("sw R(\d+),(\d+)[(]R(\d+)[)]", instraction):
            reg1 = re.search("sw R(\d+),(\d+)[(]R(\d+)[)]", instraction).groups()[0]
            imm = re.search("sw R(\d+),(\d+)[(]R(\d+)[)]", instraction).groups()[1]
            reg2 = re.search("sw R(\d+),(\d+)[(]R(\d+)[)]", instraction).groups()[2]
            ins = "101011_" + sign_expand_5(hex_to_binary(reg2)) + sign_expand_5(hex_to_binary(reg1)) \
                  + sign_expand_16(hex_to_binary(imm))
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif re.match("lw R(\d+),(\d+)[(]R(\d+)[)]", instraction):
            reg1 = re.search("lw R(\d+),(\d+)[(]R(\d+)[)]", instraction).groups()[0]
            imm = re.search("lw R(\d+),(\d+)[(]R(\d+)[)]", instraction).groups()[1]
            reg2 = re.search("lw R(\d+),(\d+)[(]R(\d+)[)]", instraction).groups()[2]
            ins = "100011_" + sign_expand_5(hex_to_binary(reg2)) + sign_expand_5(hex_to_binary(reg1)) \
                  + sign_expand_16(hex_to_binary(imm))
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif re.match("beq R(\d+),R(\d+),0x(\d{4})", instraction):
            reg1 = re.search("beq R(\d+),R(\d+),0x(\d{4})", instraction).groups()[0]
            reg2 = re.search("beq R(\d+),R(\d+),0x(\d{4})", instraction).groups()[1]
            imm = re.search("beq R(\d+),R(\d+),0x(\d{4})", instraction).groups()[2]
            ins = "000100_" + sign_expand_5(hex_to_binary(reg1)) + sign_expand_5(hex_to_binary(reg2)) \
                  + sign_expand_16(hex_to_binary(imm))
            hex_ins = binary_to_hex(ins)
            verilogstr = "assign ram[" + str(i) + "]=32'h" + hex_ins + ";  //" + instraction;
            verilog.append(verilogstr)
        elif True:
            raise Exception("The instraction '" + instraction + "' is a wrong instraction")

        i = i + 1
        if i > 32:
            raise Exception("The instructions must be less than 32 pieces")
    return verilog


if __name__ == '__main__':

    instractions = get_lines('instraction.txt')
    verilogs = compilation(instractions)
    write_verilog("instraction_out.txt", verilogs)
