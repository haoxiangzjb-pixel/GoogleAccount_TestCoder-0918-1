defmodule TestModule do
  require MacroLogger

  # 使用宏记录编译时信息
  MacroLogger.log_compile_time_info("这是一个测试消息")
  
  def test_function do
    "Hello from test function"
  end
end