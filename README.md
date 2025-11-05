I/O:

**Tx interface:**
clk - [input] clock
en_tx - [input] enable/disable transmitter
data[7:0] - [input] data to transmit
u_tx - [output] transmitter output
u_tx_done - [output] succesfully transmitted

**Rx interface:**
clk - [input] clock
en_rx - [input] enable/disable receiver
u_rx - [input] receiver input
data[7:0] - [output] received data
u_rx_done - [output] succesfully received
