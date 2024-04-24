library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

-- accumulateur n bits à l'aide du registre générique et de l'additionneur générique.
entity acc is
    generic(
        N : positive := 8
    );
    port (
        clk_acc, reset_acc : in std_logic;
        data_in_acc : in unsigned(N-1 downto 0);
        data_out_acc : out unsigned(N-1 downto 0);
        retenu_acc : out std_logic
    );
end acc;

architecture arc_acc of acc is
    signal inpute_int : unsigned(N-1 downto 0);
    signal outpute_int : unsigned(N-1 downto 0);
begin

    -- register instance
    reg_inst: entity work.registre_gen(arc2)
     generic map(
        N => N
    )
     port map(
        clk => clk_acc,
        reset => reset_acc,
        data_in => inpute_int,
        data_out => outpute_int
    );

    -- adder instance
    add_inst: entity work.additionneur(arc1)
     generic map(
        N => N
    )
     port map(
        a => data_in_acc,
        b => outpute_int,
        res => inpute_int,
        retenu => retenu_acc
    );

    data_out_acc <= inpute_int;
end arc_acc;