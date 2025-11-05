class transaction;

    randc bit [7:0]data_tx;
    bit [7:0]data_rx;
  bit __done;
//  	bit [7:0]data_tx;

  function void display(string f_name, int l_num, string str);
    $display("[%0s:%0d @ %0t][%0s] Tx data = %b Rx data= %b", f_name, l_num, $time, str,data_tx,data_rx);
    endfunction
  
  function string convert2string();
    return $sformatf("Tx data = %b Rx data= %b", data_tx, data_rx);
  endfunction
  
  function void put(bit [7:0]data);
    data_tx=data;
  endfunction
    


endclass //trans
