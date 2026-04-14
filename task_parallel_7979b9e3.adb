with Ada.Text_IO; use Ada.Text_IO;

procedure Task_Parallel_Print is

   task type Printer_Task is
      entry Start (Message : in String);
   end Printer_Task;

   task body Printer_Task is
      Msg : String (1 .. 100);
      Len : Natural;
   begin
      accept Start (Message : in String) do
         if Message'Length <= Msg'Length then
            Msg (1 .. Message'Length) := Message;
            Len := Message'Length;
         else
            Msg := Message (1 .. Msg'Length) & "...";
            Len := Msg'Length;
         end if;
      end Start;
      Put_Line ("Task printed: " & Msg (1 .. Len));
   end Printer_Task;

   Task1 : Printer_Task;
   Task2 : Printer_Task;
   Task3 : Printer_Task;

begin
   Put_Line ("Starting parallel tasks...");
   
   Task1.Start ("Hello from Task 1!");
   Task2.Start ("Greetings from Task 2!");
   Task3.Start ("Message from Task 3!");
   
   Put_Line ("All tasks completed.");
end Task_Parallel_Print;
