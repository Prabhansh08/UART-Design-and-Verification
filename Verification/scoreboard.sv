class scoreboard;

    mailbox mon2scb;
    int count;
  	int flag;
  	int test_count;

  function new(mailbox mon2scb,int test_count);
        this.mon2scb = mon2scb;
    	this.test_count=test_count;
        count=0;
      	flag=0;
    endfunction

    task main;
        transaction tr;
        forever begin
            mon2scb.get(tr);
            count++;
          if (tr.data_tx==tr.data_rx) begin
            `ms_info("SCB", $sformatf("[Test: %0d] Correct",count))
            `ms_info("SCB", tr.convert2string)
              flag=1;
            end
            else begin
             `ms_err($sformatf("[Test: %0d] Incorrect",count))
              `ms_info("SCB", tr.convert2string)
              flag=0;
            end
        end
    endtask
endclass
