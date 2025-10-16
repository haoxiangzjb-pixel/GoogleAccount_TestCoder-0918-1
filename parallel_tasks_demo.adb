with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Parallel_Tasks_Demo is
   package Random_Int is new Ada.Numerics.Discrete_Random(Integer);
   use Random_Int;
   
   -- Define a task type for printing messages
   task type Printer_Task is
      entry Start(Msg : String; Count : Integer);
   end Printer_Task;
   
   -- Implementation of the task
   task body Printer_Task is
      Gen : Random_Int.Generator;
      Message : String(1..200);
      Msg_Length : Natural;
      Iterations : Integer;
   begin
      Reset(Gen);
      accept Start(Msg : String; Count : Integer) do
         Msg_Length := Msg'Length;
         Message(1..Msg_Length) := Msg;
         Iterations := Count;
      end Start;
      
      for I in 1..Iterations loop
         -- Short random delay to demonstrate parallelism
         delay Duration(Random(Gen) * 0.1);
         Put_Line("Task - Iteration " & Integer'Image(I) & ": " & 
                  Message(1..Msg_Length));
      end loop;
      
      Put_Line("Task has finished.");
   end Printer_Task;
   
   -- Declare instances of the task
   Task1 : Printer_Task;
   Task2 : Printer_Task;
   Task3 : Printer_Task;

begin
   Put_Line("Starting parallel tasks demo...");
   
   -- Start each task with different messages and iteration counts
   Task1.Start("Hello from Task 1!", 3);
   Task2.Start("Greetings from Task 2!", 4);
   Task3.Start("Message from Task 3!", 2);
   
   Put_Line("All tasks started. Waiting for completion...");
   
   -- The main procedure will wait for all tasks to complete
   null; -- Tasks will run to completion before the program ends
end Parallel_Tasks_Demo;