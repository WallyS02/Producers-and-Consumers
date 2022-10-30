with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;
with main_Types;
use main_Types;
with bufor;
use bufor;

package consumer is
  -- Consumer gets an arbitrary assembly of several products from the buffer
   task type Consumer is
   -- Give the Consumer an identity
     entry Start(Consumer_Number: in Consumer_Type;
		 Consumption_Time: in Integer);
   end Consumer;
   B: Buffer;
end consumer;
