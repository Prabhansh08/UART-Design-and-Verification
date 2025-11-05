`define ms_info(id, str) $display("[%0s:%0d @ %0t][%0s] %s", `__FILE__, `__LINE__, $time, id, str);
`define ms_err(str) $error("\033[31m[%0s:%0d @ %0t]%s", `__FILE__,`__LINE__, $time,str);

`include "test.sv"
`include "UART_Tx.v"
`include "UART_Rx.v"
`include "interface.sv"

module top;

bit clk;
bit en_tx, en_rx;
wire serial_line;
  
always #5 clk=~clk;

  initial begin
    #5 en_tx=1; en_rx=1;
  end

uart_intf intf(clk, en_tx, en_rx);


uart_master master(
    .clk(intf.clk),
    .en_tx(en_tx),
    .data(intf.data_tx),
    .u_tx(serial_line),
    .u_tx_done(intf.tx_done)
);

uart_slave slave(
    .clk(intf.clk),
    .en_rx(intf.en_rx),
    .data(intf.data_rx),
    .u_rx(serial_line),
    .u_rx_done(intf.rx_done)
);


test_main t1(intf);
endmodule
