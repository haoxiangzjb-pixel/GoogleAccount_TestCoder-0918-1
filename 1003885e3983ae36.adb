with Ada.Text_IO; use Ada.Text_IO;

procedure parallel_tasks_random is

   task type Printer_Task(Id : Integer);
   
   task body Printer_Task is
   begin
      for I in 1..5 loop
         Put_Line("Task " & Integer'Image(Id) & " - Message " & Integer'Image(I));
         delay 0.2;
      end loop;
   end Printer_Task;
   
   Task1 : Printer_Task(Id => 1);
   Task2 : Printer_Task(Id => 2);
   Task3 : Printer_Task(Id => 3);

begin
   Put_Line("Main program started");
   
   Put_Line("All tasks completed");
end parallel_tasks_random;