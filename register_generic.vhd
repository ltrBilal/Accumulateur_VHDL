library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--  registre générique de n bits.
entity registre_gen is
    generic(
        N : positive := 8
    );
    port(
        clk, reset : in std_logic;
        data_in : in unsigned(N-1 downto 0);
        data_out : out unsigned(N-1 downto 0)
    );
end registre_gen;

architecture arc2 of registre_gen is
    signal enable_in : std_logic := '1';
begin
    process (clk, reset)
    begin
        if reset = '1' then
            data_out <= ((others => '0') );
        elsif rising_edge(clk) then
            if enable_in = '1' then
                data_out <= data_in;
            end if;
        end if;
    end process;
end arc2;