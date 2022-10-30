with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

package main_Types is
   Number_Of_Products: constant Integer := 5;
   Number_Of_Assemblies: constant Integer := 3;
   Number_Of_Consumers: constant Integer := 2;
   subtype Product_Type is Integer range 1 .. Number_Of_Products;
   subtype Assembly_Type is Integer range 1 .. Number_Of_Assemblies;
   subtype Consumer_Type is Integer range 1 .. Number_Of_Consumers;
   Product_Name: constant array (Product_Type) of String(1 .. 6)
     := ("Barley", "Rye   ", "Corn  ", "Wheat ", "Barrel");
   Assembly_Name: constant array (Assembly_Type) of String(1 .. 14)
     := ("Jack Daniel's ", "Johnnie Walker", "Jameson       ");
   package Random_Assembly is new
     Ada.Numerics.Discrete_Random(Assembly_Type);
   type My_Str is new String(1 ..256);
end main_Types;
