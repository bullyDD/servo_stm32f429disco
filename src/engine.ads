------------------------------------------------------------------------------
--                                                                          --
--                  Copyright (C) 2023, CDS                                 --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------
--  @PWM_Engine pin connected to the servi pulse wave input.                --
--  This pin must be capable of PWM output.                                 --
--  @PWM_Output_Timer timer uses to drive the pin.                          --
--  @PWM_Output_Engine                                                      --
--  @PWM_Output_AF target angle in degree associated with MIN_FREQ. Default --
--  @PWM_Frequency PWM fequency 50Hz, equivalent to 20 ms                   --
------------------------------------------------------------------------------

with Beta_Types;
with STM32.GPIO;           use STM32.GPIO;
with STM32.Timers;         use STM32.Timers;
with STM32.Device;         use STM32.Device;
with STM32.PWM;            use STM32.PWM;

package Engine is

   package BT renames Beta_Types;
  
   procedure Initialize_PWM_Engine;
   --  MUST be called before use servo
   procedure Set_Duty (Duty : STM32.PWM.Microseconds);
   procedure Set_Duty_Off (Duty : STM32.PWM.Microseconds);
   function Get_Time return Microseconds;
   --  End
private 
   PWM_Engine        : GPIO_Point renames PA6;
   PWM_Output_Timer  : Timer renames Timer_3;
   PWM_Output_Engine : PWM_Modulator;
   PWM_Output_AF     : constant STM32.GPIO_Alternate_Function := 
     GPIO_AF_TIM3_2;
   PWM_Frequency     : constant := 50;
  
end Engine;
