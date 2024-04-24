library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity acc_tb is
end acc_tb;

architecture arc_accum of acc_tb is
   
    constant N : integer := 8;
    signal clk : std_logic;
    signal reset : std_logic;
    signal data_in : unsigned(N-1 downto 0);
    signal data_out : unsigned(N-1 downto 0);
    
begin
    c1 : entity work.acc
     port map(
        clk_acc => clk,
        reset_acc => reset,
        data_in_acc => data_in,
        data_out_acc => data_out
    );

    -- simulation d'horloge
    horloge_process : process
    begin
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
    end process;

    -- simulation pour RESET
    reset_process : process
    begin
        reset <= '1';
        wait for 5 ns;
        reset <= '0';
        wait;
    end process;

    -- simulation pour data_in
    in_process : process (clk, reset)
        variable value : unsigned(N-1 downto 0);
        variable i : integer;
    begin
            if reset = '1' then
                i := 0;
                value := to_unsigned(i, N);
            elsif rising_edge(clk) then
                i := i + 1; 
                value := to_unsigned(i, N);
            end if;
            data_in <= value;
    end process;
end arc_accum;