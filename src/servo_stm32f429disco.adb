with Ada.Real_Time;
with Beta_Types;

with Engine;
with HAL.Framebuffer;

with STM32;
with STM32.Device;
with STM32.PWM;

with LCD_Std_Out;

procedure Servo_Stm32f429disco is
   use Ada.Real_Time;
   use Engine;

   use HAL.Framebuffer;

   use STM32.Device;
   use STM32.PWM;

   use LCD_Std_Out;
   
   function Get_Start_Time return Time is
     (Clock);

   Period : constant Time_Span := Milliseconds (1000);
   Next   : Time := Get_Start_Time + Period;
   
begin
   --  LCD Params --
   Set_Orientation (To => Landscape);
   Clear_Screen;

   --  Initialize servo
   Initialize_PWM_Engine;

   --  Go to Postion 90°
   Set_Duty (Duty => 2000);
   Put_Line("Theta= 90°");
   delay until Next;
   Next := Next + Period;
   Clear_Screen;
   
   --  Go to Postion 45°
   Set_Duty (Duty => 1750);
   delay until Next;
   Next := Next + Period;

   --  Go to Position 0°
   Set_Duty (Duty => 1500);
   delay until Next;
   Next := Next + Period;

   --  Go to Postion -45°
   Set_Duty (Duty => 1250);
   delay until Next;
   Next := Next + Period;

   --  Go to position -90°
   Set_Duty (Duty => 1000);
   delay until Next;
   Next := Next + Period;

   loop
      null;
   end loop;
end Servo_Stm32f429disco;
