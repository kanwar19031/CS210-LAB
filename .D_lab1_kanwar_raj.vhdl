library IEEE;
use IEEE.std_logic_1164.all;

entity D_lab1_kanwar_raj is
port(
  a: in std_logic;
  b: in std_logic;
  c: out std_logic);
end entity;

architecture functionality of D_lab1_kanwar_raj is
begin
    c <= a OR b;
end functionality;