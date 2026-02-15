//1.wire.v
module top_module( input in, output out );
    assign out=in;
endmodule

//2.wire4.v
module top_module( 
    input a,b,c,
    output w,x,y,z );
    assign w=a;
    assign x=b;
    assign y=b;
    assign z=c;
endmodule

//notgate.v
module top_module(input in,output out);
    assign out=~in;
endmodule

//andgate.v
module top_module(
    input a,b,
    output out);
    assign out=a&b;
endmodule

//norgate.v
module top_module(
    input a,b,
    output out);
    assign out=~(a|b);
endmodule

//xnorgate.v
module top_module(
    input a,b,
    output out);
    assign out=~(a^b);
endmodule

//wire_decl.v
//`default_nettype none// 禁用默认线网类型，强制显式声明
module top_module(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output wire out,
    output wire out_n);
    wire a1,a2,b1;
    assign a1=a&b;
    assign a2=c&d;
    assign b1=a1|a2;
    assign out=b1;
    assign out_n=~b1;
endmodule

//7458.v
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire a1,a2,a3,a4;
    assign a1=p1a&p1b&p1c;
    assign a2=p1d&p1e&p1f;
    assign a3=p2a&p2b;
    assign a4=p2c&p2d;
    assign p1y=a1|a2;
    assign p2y=a3|a4;
endmodule

//vector0.v
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    assign outv=vec;
    assign o2=vec[2];
    assign o1=vec[1];
    assign o0=vec[0];
endmodule

//vector1.v
//`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_hi=in[15:8];
    assign out_lo=in[7:0];
endmodule

//vector2.v
module top_module( 
    input [31:0] in,
    output [31:0] out );
    assign out[31:24] = in[7:0];
    assign out[23:16]=in[15:8];
    assign out[15:8]=in[23:16];
    assign out[7:0]=in[31:24];
endmodule

//vectorgates.v
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_logical=a||b;
    assign out_or_bitwise=a|b;
    assign out_not=~{b,a};
endmodule

//gate4.v
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and=in[0]&in[1]&in[2]&in[3];
    assign out_or=in[0]|in[1]|in[2]|in[3];
    assign out_xor=in[0]^in[1]^in[2]^in[3];
endmodule

//vector3.v
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );
    assign w={a[4:0],b[4:2]};
    assign x={b[1:0],c[4:0],d[4]};
    assign y={d[3:0],e[4:1]};
    assign z={e[0],f[4:0],2'b11};

endmodule

//vectorr.v 
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    assign out={in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
endmodule

//vector4.v
module top_module (
    input [7:0] in,
    output [31:0] out );
    assign out={{24{in[7]}},in};
endmodule

//vector5.v 
module top_module (
    input a, b, c, d, e,
    output [24:0] out );
    wire [4:0] a5,b5,c5,d5,e5,f;
    assign f={a,b,c,d,e};
    assign a5={5{a}};
    assign b5={5{b}};
    assign c5={5{c}}; 
    assign d5={5{d}};
    assign e5={5{e}};
    assign out={~(f^a5),~(f^b5),~(f^c5),~(f^d5),~(f^e5)};

endmodule

//module.v 
module top_module ( input a, input b, output out );
    mod_a inst_mod_a (.in1(a),.in2(b),.out(out));
endmodule

//module_pos.v 
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a inst_mod_a (out1,out2,a,b,c,d);
endmodule

//module_name.v 
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a inst_mod_a (.out1(out1),.out2(out2),.in1(a),.in2(b),.in3(c),.in4(d));
endmodule

//module_shift.v
module top_module ( input clk, input d, output q );
    wire q1,q2;
    my_dff my_dff1 (.clk(clk),.d(d),.q(q1));
    my_dff my_dff2 (.clk(clk),.d(q1),.q(q2));
    my_dff my_dff3 (.clk(clk),.d(q2),.q(q));
endmodule

//module_shift8.v 
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] q1,q2,q3;//要定义位宽！！
    my_dff8 f1 (.clk(clk),.d(d),.q(q1));
    my_dff8 f2 (.clk(clk),.d(q1),.q(q2));
    my_dff8 f3 (.clk(clk),.d(q2),.q(q3));
    assign q=(sel==2'b00)?d:
             (sel==2'b01)?q1:
             (sel==2'b10)?q2:
             (sel==2'b11)?q3:d;
endmodule

//module_add.v 
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c_ad;
    wire [15:0] sum1,sum2;
    add16 a1 (.a(a[15:0]),.b(b[15:0]),.cout(c_ad),.sum(sum1));
    add16 a2 (.a(a[31:16]),.b(b[31:16]),.cin(c_ad),.sum(sum2));
    assign sum={sum2,sum1};
endmodule

//module_fadd.v 
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire c_ad;
    wire [15:0] sum1,sum2;
    add16 a1 (.a(a[15:0]),.b(b[15:0]),.cout(c_ad),.sum(sum1));
    add16 a2 (.a(a[31:16]),.b(b[31:16]),.cin(c_ad),.sum(sum2));
    assign sum={sum2,sum1};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum=(a+b+cin)&1;
    assign cout=((a+b+cin)&2)>>1;
    /*或者
    // 本位和：异或运算（等价于(a+b+cin) % 2）
    assign sum = a ^ b ^ cin;
    // 进位：任意两个输入为1则进位
    assign cout = (a & b) | (a & cin) | (b & cin);
    */
endmodule

//module_cseladd.v 
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum1,sum2,sum3;
    wire cout;
    add16 a1 (.a(a[15:0]),.b(b[15:0]),.cin(0),.cout(cout),.sum(sum1));
    add16 a2 (.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(sum2));
    add16 a3 (.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(sum3));
    assign sum = cout ? {sum3, sum1} : {sum2, sum1};
endmodule

//module_addsub.v  减法是反码加1
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b2;
    assign b2=sub?((b^32'b1111_1111_1111_1111_1111_1111_1111_1111)+1):b;
    wire c_ad;
    wire [15:0] sum1,sum2;
    add16 a1 (.a(a[15:0]),.b(b2[15:0]),.cout(c_ad),.sum(sum1));
    add16 a2 (.a(a[31:16]),.b(b2[31:16]),.cin(c_ad),.sum(sum2));
    assign sum={sum2,sum1};
endmodule

//alwaysblock1.v 
// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    assign out_assign=a&b;
    always @(*) begin
        out_alwaysblock=a&b;
    end
endmodule

//alwaysblock2.v 
// synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    assign out_assign=a^b;
    always @(*) begin
        out_always_comb=a^b;
    end
    always @(posedge clk) begin
        out_always_ff=a^b;
    end
endmodule
//always_if.v 
// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    assign out_assign=(sel_b1==1&&sel_b2==1)?b:a;
    always @(*) begin
        if(sel_b1==1&&sel_b2==1) out_always=b;
        else out_always=a;
    end
endmodule

//always_if2.v  if和else匹配，否则会产生latch(锁存器)
// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); 

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else shut_off_computer=0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else keep_driving=0;
    end

endmodule

//always_case.v  
// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel)
            0:out=data0;
            1:out=data1;
            2:out=data2;
            3:out=data3;
            4:out=data4;
            5:out=data5;
            default:out=0;
        endcase 
    end

endmodule

//always_case2.v //reg不能用assign！
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin
    if (in[0])  pos = 0;
    else if (in[1]) pos = 1;
    else if (in[2]) pos = 2;
    else if (in[3]) pos = 3;
    else  pos = 0;
    
end
endmodule

//always_casez
// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    always @(*) begin
        casez(in)
            8'bzzzz_zzz1:pos=0;
            8'bzzzz_zz10:pos=1;
            8'bzzzz_z100:pos=2;
            8'bzzzz_1000:pos=3;
            8'bzzz1_0000:pos=4;
            8'bzz10_0000:pos=5;
            8'bz100_0000:pos=6;
            8'b1000_0000:pos=7;
            default:pos=0;
        endcase
    end
endmodule

//always_nolatches
// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    always @(*) begin
        up=0;
        down=0;
        left=0;
        right=0;
        case(scancode)
            16'he06b:left=1;
            16'he072:down=1;
            16'he074:right=1;
            16'he075:up=1;
        endcase
    end
endmodule

//conditional.v 
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);
    wire [7:0] m1,m2;
    assign m1=(a>b)?b:a;
    assign m2=(m1>c)?c:m1;
    assign min=(m2>d)?d:m2;
endmodule

//reduction
module top_module (
    input [7:0] in,
    output parity); 
    assign parity=^in;
endmodule

//gates100
module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    assign out_and=&in;
    assign out_or=|in;
    assign out_xor=^in;
endmodule

//vector100r
module top_module( 
    input [99:0] in,
    output reg [99:0] out
);
    integer i;
    always @(*)begin
        for(i=0;i<100;i=i+1) begin
            out[i]=in[99-i];
        end
    end
endmodule
