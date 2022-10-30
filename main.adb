-- Sebastian Kutny, 188586, Informatyka, sem. 3, Jezyki programowania

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;
with consumer;
use consumer;
with main_Types;
use main_Types;

procedure Main is
   -- Producer produces determined product
   task type Producer is
      -- Give the Producer an identity, i.e. the product type
      entry Start(Product: in Product_Type; Production_Time: in Integer);
   end Producer;

   P: array ( 1 .. Number_Of_Products ) of Producer;
   K: array ( 1 .. Number_Of_Consumers ) of Consumer.Consumer;

   task body Producer is
      subtype Production_Time_Range is Integer range 3 .. 6;
      package Random_Production is new
	Ada.Numerics.Discrete_Random(Production_Time_Range);
      G: Random_Production.Generator;	--  generator liczb losowych
      Product_Type_Number: Integer;
      Product_Number: Integer;
      Production: Integer;
   begin
      accept Start(Product: in Product_Type; Production_Time: in Integer) do
	 Random_Production.Reset(G);	--  start random number generator
	 Product_Number := 1;
	 Product_Type_Number := Product;
	 Production := Production_Time;
      end Start;
      Put_Line("Started producer of " & Product_Name(Product_Type_Number));
      loop

    delay Duration(Random_Production.Random(G)); --  simulate production
	 Put_Line("Produced product " & Product_Name(Product_Type_Number)
		    & " number "  & Integer'Image(Product_Number));
         -- Accept for storage
         loop
               B.Take(Product_Type_Number, Product_Number);
               Product_Number := Product_Number + 1;
               exit;
         end loop;
      end loop;
   end Producer;

begin
   for I in 1 .. Number_Of_Products loop
      P(I).Start(I, 10);
   end loop;
   for J in 1 .. Number_Of_Consumers loop
      K(J).Start(J,12);
   end loop;
end Main;
