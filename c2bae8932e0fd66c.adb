with Ada.Text_IO; use Ada.Text_IO;

procedure Parallel_Message_Print is

   task Task1;
   task Task2;
   task Task3;

   task body Task1 is
   begin
      for I in 1..5 loop
         Put_Line("Task 1: Message " & Integer'Image(I));
         delay 0.5;
      end loop;
   end Task1;

   task body Task2 is
   begin
      for I in 1..5 loop
         Put_Line("Task 2: Message " & Integer'Image(I));
         delay 0.7;
      end loop;
   end Task2;

   task body Task3 is
   begin
      for I in 1..5 loop
         Put_Line("Task 3: Message " & Integer'Image(I));
         delay 0.9;
      end loop;
   end Task3;

begin
   Put_Line("Main procedure started");
   delay 3.0;
   Put_Line("Main procedure ending");
end Parallel_Message_Print;