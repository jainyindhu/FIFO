FIFO (First-In First-Out) using Verilog HDL

📌 Project Description

This project implements a synchronous FIFO (First-In First-Out) memory buffer using Verilog HDL.

A FIFO stores data in memory and returns the data in the same order in which it was written. The first data written into the FIFO is the first data read from it.

This project implements an 8-bit wide and 4-depth FIFO with read and write control signals and status flags.

---

🎯 Objective

The objective of this project is to design and simulate a FIFO using Verilog HDL and understand:

- Memory storage
- Read and write operations
- Read and write pointers
- FIFO status flags
- Sequential logic
- Testbench verification
- Waveform simulation

---

🔧 FIFO Specifications

Parameter| Value
Data Width| 8 bits
FIFO Depth| 4
Total Storage| 32 bits
Read Operation| Synchronous
Write Operation| Synchronous
Full Flag| Supported
Empty Flag| Supported

---

📥 Inputs

Signal| Description
"clk"| System clock
"reset"| Resets the FIFO
"wr_en"| Write enable
"rd_en"| Read enable
"data_in[7:0]"| Input data

---

📤 Outputs

Signal| Description
"data_out[7:0]"| Output data
"full"| HIGH when FIFO is full
"empty"| HIGH when FIFO is empty

---

🧠 How FIFO Works

FIFO follows the principle:

First Data In → First Data Out

For example:

Write:
10 → 20 → 30 → 40

Read:
10 → 20 → 30 → 40

The order of data is preserved.

---

🏗️ Block Diagram

                   ┌─────────────────────┐
                   │                     │
 data_in[7:0] ────►│                     │
                   │       FIFO          │────► data_out[7:0]
 wr_en ───────────►│                     │
 rd_en ───────────►│   8-bit × 4-depth   │
                   │                     │
 clk ─────────────►│                     │
 reset ───────────►│                     │
                   │                     │────► full
                   │                     │────► empty
                   └─────────────────────┘

---

🧮 Internal Architecture

The FIFO contains:

1. Memory

Stores four 8-bit data values.

Memory[0]
Memory[1]
Memory[2]
Memory[3]

2. Write Pointer

Points to the location where the next data will be written.

3. Read Pointer

Points to the location from which the next data will be read.

4. Counter

Keeps track of the number of data items currently stored.

---

📊 FIFO Status

Count| Full| Empty
0| 0| 1
1| 0| 0
2| 0| 0
3| 0| 0
4| 1| 0

---

💻 Verilog Implementation

The FIFO uses the following logic for status flags:

assign full  = (count == DEPTH);
assign empty = (count == 0);

Data is written only when the FIFO is not full:

if (wr_en && !full) begin
    mem[wr_ptr] <= data_in;
    wr_ptr <= wr_ptr + 1'b1;
end

Data is read only when the FIFO is not empty:

if (rd_en && !empty) begin
    data_out <= mem[rd_ptr];
    rd_ptr <= rd_ptr + 1'b1;
end

---

🧪 Testbench

The testbench performs the following operations:

Step 1: Reset

The FIFO is reset and becomes empty.

Step 2: Write Data

The following values are written:

10
20
30
40

After four writes:

FULL = 1
EMPTY = 0

Step 3: Read Data

The data is read from the FIFO:

10
20
30
40

Step 4: Check Empty

After reading all four values:

FULL = 0
EMPTY = 1

---

🖥️ Expected Console Output

--------------------------------
After Writing 4 Values
FULL  = 1
EMPTY = 0
--------------------------------
Read Data = 10
Read Data = 20
Read Data = 30
Read Data = 40
--------------------------------
After Reading All Values
FULL  = 0
EMPTY = 1
--------------------------------
Simulation Completed

---

📈 Simulation

The testbench generates a waveform file:

waveform.vcd

The waveform can be viewed using GTKWave.

Important signals to observe

- "clk"
- "reset"
- "wr_en"
- "rd_en"
- "data_in"
- "data_out"
- "full"
- "empty"
- "wr_ptr"
- "rd_ptr"
- "count"

Save the waveform screenshot as:

simulation/waveform.png

---

▶️ How to Run

Step 1: Compile

Using Icarus Verilog:

iverilog -o fifo_sim fifo.v fifo_tb.v

Step 2: Run Simulation

vvp fifo_sim

Step 3: View Waveform

gtkwave waveform.vcd

---

🛠️ Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- GitHub

---

📚 Applications

FIFO buffers are widely used in:

- Processor systems
- Data buffering
- UART communication
- Networking
- Digital communication
- Audio and video processing
- FPGA designs
- Clock-domain data transfer systems

---

⭐ Key Learning Outcomes

This project demonstrates:

- FIFO architecture
- Memory design
- Read and write pointers
- Sequential logic
- Status flag generation
- Data buffering
- Verilog HDL
- Testbench development
- Waveform simulation
- GitHub project organization

---

👩‍💻 Author

JAINY INDHU

Electronics and Communication Engineering