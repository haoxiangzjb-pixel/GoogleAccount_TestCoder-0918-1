with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Parallel_Message_Task is
   -- 定义一个任务类型用于并行打印
   task type Message_Printer (ID : Integer; Message : String) is
      entry Start;
   end Message_Printer;

   -- 实现任务
   task body Message_Printer is
      subtype Message_Range is Integer range 1..5;
      package Rand is new Ada.Numerics.Discrete_Random(Message_Range);
      Gen : Rand.Generator;
   begin
      Rand.Reset(Gen);
      accept Start;
      for I in 1..3 loop
         delay Duration(Rand.Random(Gen) * 0.1); -- 随机延迟
         Put_Line("Task " & Integer'Image(ID) & " - Message: " & Message & " - Iteration" & Integer'Image(I));
      end loop;
   end Message_Printer;

   -- 创建任务实例
   Task1 : Message_Printer(1, "Hello from Task 1");
   Task2 : Message_Printer(2, "Greetings from Task 2");
   Task3 : Message_Printer(3, "Message from Task 3");
   
begin
   -- 启动所有任务
   Task1.Start;
   Task2.Start;
   Task3.Start;
   
   Put_Line("All tasks started. Waiting for completion...");
   
   -- 主程序等待任务完成
   null; -- 实际上任务会自动完成
end Parallel_Message_Task;