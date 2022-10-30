with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;
with main_Types;
use main_Types;

package bufor is

   task type Buffer is
      -- Accept a product to the storage provided there is a room for it
      entry Take(Product: in Product_Type; Number: in Integer);
      -- Deliver an assembly provided there are enough products for it
      entry Deliver(Assembly: in Assembly_Type; Number: out Integer);
   end Buffer;

end bufor;
