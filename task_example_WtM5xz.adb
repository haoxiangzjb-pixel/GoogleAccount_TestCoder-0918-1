with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Float_Random;

procedure Task_Example_WtM5xz is
   task type Printer_Task;
   
   task body Printer_Task is
      Rnd_Gen : Ada.Numerics.Float_Random.Generator;
      Rand_Delay : Duration;
   begin
      Ada.Numerics.Float_Random.Reset(Gen => Rnd_Gen);
      
      for I in 1..3 loop
         Rand_Delay := Duration(Ada.Numerics.Float_Random.Random(Rnd_Gen));
         delay Rand_Delay; -- 随机延迟
         Put_Line("并行任务正在打印消息 #" & Integer'Image(I));
      end loop;
      
   exception
      when others =>
         Put_Line("任务中发生异常");
   end Printer_Task;
   
   -- 创建多个任务实例
   Task1 : Printer_Task;
   Task2 : Printer_Task;
   Task3 : Printer_Task;
   
begin
   Put_Line("主程序开始");
   
   -- 等待所有任务完成（通过延迟确保它们有时间完成）
   delay 3.0;
   
   Put_Line("主程序结束");
   
end Task_Example_WtM5xz;