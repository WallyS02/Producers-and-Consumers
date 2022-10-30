package body consumer is
task body Consumer is
      subtype Consumption_Time_Range is Integer range 4 .. 8;
      package Random_Consumption is new
	Ada.Numerics.Discrete_Random(Consumption_Time_Range);
      G: Random_Consumption.Generator;	--  random number generator (time)
      G2: Random_Assembly.Generator;	--  also (assemblies)
      Consumer_Nb: Consumer_Type;
      Assembly_Number: Integer;
      Consumption: Integer;
      Assembly_Type: Integer;
      Consumer_Name: constant array (1 .. Number_Of_Consumers)
	of String(1 .. 18)
	:= ("Dom Piwa          ", "Alko Outlet Jasien");
   begin
      accept Start(Consumer_Number: in Consumer_Type;
		     Consumption_Time: in Integer) do
	 Random_Consumption.Reset(G);	--  ustaw generator

	 Consumer_Nb := Consumer_Number;
	 Consumption := Consumption_Time;
      end Start;
      Put_Line("Started consumer " & Consumer_Name(Consumer_Nb));
      loop
	 delay Duration(Random_Consumption.Random(G)); --  simulate consumption
	 Assembly_Type := Random_Assembly.Random(G2);
	 -- take an assembly for consumption
    B.Deliver(Assembly_Type, Assembly_Number);
         -- 0 number assembly problem
         if Assembly_Number = 0 then
           Put_Line(Consumer_Name(Consumer_Nb) & ": ordered assembly " &
		    Assembly_Name(Assembly_Type) & "but storage could not sell it");
         else
           Put_Line(Consumer_Name(Consumer_Nb) & ": taken assembly " &
		    Assembly_Name(Assembly_Type) & " number " &
           Integer'Image(Assembly_Number));
         end if;
      end loop;
   end Consumer;
   end consumer;
