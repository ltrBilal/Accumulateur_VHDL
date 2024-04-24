library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- additionneur générique de 2 nombres non signés sur n bits.
entity additionneur is
    generic(
        N : positive := 8
    );
    port(
        a : in unsigned(N-1 downto 0);
        b : in unsigned(N-1 downto 0);
        res : out unsigned(N-1 downto 0);
        retenu : out std_logic
    );
end additionneur;

architecture arc1 of additionneur is
    signal tmp : unsigned(N downto 0);
begin
    tmp <= ('0' & a) + ('0' & b);
    res <= tmp(N-1 downto 0);
    retenu <= tmp(N);
end arc1;