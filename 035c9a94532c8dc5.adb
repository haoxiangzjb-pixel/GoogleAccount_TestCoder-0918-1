with Ada.Text_IO;
with Ada.Task_Identification;

procedure Parallel_Print is
   task type Printer_Task;
   type Printer_Access is access Printer_Task;

   task body Printer_Task is
      Task_Id : Ada.Task_Identification.Task_Id;
   begin
      Task_Id := Ada.Task_Identification.Current_Task;
      for I in 1..5 loop
         Ada.Text_IO.Put_Line("Task " & 
            Ada.Task_Identification.Image(Task_Id) & 
            " printing message " & Integer'Image(I));
         delay 0.1; -- 延时0.1秒，以便观察并行效果
      end loop;
   end Printer_Task;

   -- 创建多个任务实例
   Task1 : aliased Printer_Task;
   Task2 : aliased Printer_Task;
   Task3 : aliased Printer_Task;
begin
   Ada.Text_IO.Put_Line("Starting parallel tasks...");
   -- 等待所有任务完成
   null; -- 实际上任务会在声明后自动启动，这里只是程序主体的占位符
end Parallel_Print;