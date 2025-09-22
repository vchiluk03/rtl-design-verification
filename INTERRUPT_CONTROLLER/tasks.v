//===========================
// File: tb/tasks.v
// Description: Task definitions for interrupt controller testbench
//===========================

integer i, j;
reg exist_f;
integer random_value;

// Task: Reset DUT
// ---------------------------
task reset_dut();
begin
  prst_i = 1;
  paddr_i = 0;
  penable_i = 0;
  pwdata_i = 0;
  pwrite_i = 0;
  intp_serviced_i = 0;
  intp_active_i = 0;
  repeat(2) @(posedge pclk_i);
  @(posedge pclk_i) prst_i = 0;
end
endtask

// Task: Assign highest priority to lower-numbered peripherals
// ---------------------------
task write_priority_regA_LOWEST_PERP_HIGHEST_PR();
begin
  for (i = 0; i < NUM_OF_PERIPHERALS; i = i + 1) begin
    @(posedge pclk_i);
    paddr_i   = i;
    pwrite_i  = 1;
    pwdata_i  = NUM_OF_PERIPHERALS - 1 - i;
    penable_i = 1;
    wait(pready_o == 1);
  end
  @(posedge pclk_i);
  penable_i = 0;
  pwrite_i  = 0;
  paddr_i   = 0;
  pwdata_i  = 0;
end
endtask

// Task: Assign lowest priority to lower-numbered peripherals
// ---------------------------
task write_priority_regA_LOWEST_PERP_LOWEST_PR();
begin
  for (i = 0; i < NUM_OF_PERIPHERALS; i = i + 1) begin
    @(posedge pclk_i);
    paddr_i   = i;
    pwrite_i  = 1;
    pwdata_i  = i;
    penable_i = 1;
    wait(pready_o == 1);
  end
  @(posedge pclk_i);
  penable_i = 0;
  pwrite_i  = 0;
  paddr_i   = 0;
  pwdata_i  = 0;
end
endtask

// Task: Write unique random priority values to each peripheral
// ---------------------------
task write_priority_regA_with_RANDOM_UNIQUE_PRIORITIES();
begin
  i = 0;
  while (i < NUM_OF_PERIPHERALS) begin
    @(posedge pclk_i);
    exist_f = 0;
    random_value = $urandom_range(0, NUM_OF_PERIPHERALS - 1);

    for (j = 0; j < i; j = j + 1) begin
      if (dut.priority_regA[j] == random_value)
        exist_f = 1;
    end

    if (exist_f == 0) begin
      paddr_i   = i;
      pwrite_i  = 1;
      pwdata_i  = random_value;
      penable_i = 1;
      wait(pready_o == 1);
      i = i + 1;
    end
  end

  @(posedge pclk_i);
  penable_i = 0;
  pwrite_i  = 0;
  paddr_i   = 0;
  pwdata_i  = 0;
end
endtask

// Task: Display contents of priority register
// ---------------------------
task display_priority_regA();
begin
  for (i = 0; i < NUM_OF_PERIPHERALS; i = i + 1) begin
    $display("\t\t---- priority_regA[%0d]\t:\t%0d  ----", i, dut.priority_regA[i]);
  end
end
endtask

// Task: Read each entry from priority register
// ---------------------------
task read_priority_regA();
begin
  for (i = 0; i < NUM_OF_PERIPHERALS; i = i + 1) begin
    @(posedge pclk_i);
    penable_i = 1;
    pwrite_i  = 0;
    paddr_i   = i;
    wait(pready_o == 1);
  end
  @(posedge pclk_i);
  penable_i = 0;
  paddr_i   = 0;
end
endtask

