with Ada.Text_IO; use Ada.Text_IO;

procedure Simple_Parallel_Demo is
   task type Counter_Task is
      entry Start(Name : in String);
   end Counter_Task;

   task body Counter_Task is
      Task_Name : String(1..20);
      Name_Length : Natural;
   begin
      accept Start(Name : in String) do
         Name_Length := Name'Length;
         Task_Name(1..Name_Length) := Name;
      end Start;
      
      for I in 1..5 loop
         Put_Line(Task_Name(1..Name_Length) & " - Count: " & Integer'Image(I));
         delay 0.2;
      end loop;
      Put_Line(Task_Name(1..Name_Length) & " finished.");
   end Counter_Task;

   Task_A : Counter_Task;
   Task_B : Counter_Task;
   Task_C : Counter_Task;

begin
   Put_Line("Starting parallel tasks...");
   Task_A.Start("Task A");
   Task_B.Start("Task B");
   Task_C.Start("Task C");
   Put_Line("All tasks started.");
end Simple_Parallel_Demo;