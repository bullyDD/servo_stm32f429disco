package body Engine is
   use BT;
   ---------------------------
   -- Initialize_PWM_Engine --
   ---------------------------
   procedure Initialize_PWM_Engine is
   begin
      Configure_PWM_Timer (Generator => PWM_Output_Timer'Access,
                           Frequency => PWM_Frequency);
      PWM_Output_Engine.Attach_PWM_Channel (Generator => PWM_Output_Timer'Access,
                                            Channel   => Channel_1,
                                            Point     => PWM_Engine,
                                            PWM_AF    => PWM_Output_AF);
      PWM_Output_Engine.Set_Duty_Time (0);
      PWM_Output_Engine.Enable_Output;
   end Initialize_PWM_Engine;
   --  End
   --------------
   -- Set_Duty --
   --------------
   procedure Set_Duty (Duty : STM32.PWM.Microseconds) is
   begin
      PWM_Output_Engine.Enable_Output;
      PWM_Output_Engine.Set_Duty_Time (Duty);
   end Set_Duty;
   --  End
   ------------------
   -- Set_Duty_Off --
   ------------------
   procedure Set_Duty_Off (Duty : STM32.PWM.Microseconds) is
   begin
      PWM_Output_Engine.Set_Duty_Time (Duty);
      PWM_Output_Engine.Disable_Output;
   end Set_Duty_Off;
   --  End
   -----------------
   function Get_Time return Microseconds is
   begin
      return Microseconds_Per_Period (This => PWM_Output_Engine);
   end Get_Time;
   --  End
begin
   null;
end Engine;
