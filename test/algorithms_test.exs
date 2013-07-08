Code.require_file "test_helper.exs", __DIR__

defmodule AlgorithmsTest do
    use ExUnit.Case

    test "gcd" do
        numbers = [105, 70, 35, 15]
        result = Algorithms.Math.gcd numbers
        assert result == 5
    end

    test "empty_gcd" do
        numbers = []
        result = Algorithms.Math.gcd numbers
        assert result == 0
    end

    test "lcm" do
        numbers = [3, 4, 20]
        result = Algorithms.Math.lcm numbers
        assert result == 60
    end

    test "empty_lcm" do
        numbers = []
        result = Algorithms.Math.lcm numbers
        assert result == 0
    end

    test "binary_search" do
        l = [22, 32, 42, 52, 62]
        {state, result} = Algorithms.Search.binary l, 52
        assert state == :ok
        assert result == 4
    end

    test "ne_item_binary_search" do
        l = [22, 32, 42, 52, 62]
        {state, result} = Algorithms.Search.binary l, 1337
        assert state == :error
        assert result == -1
    end

    test "factorial" do
        num = 5
        result = Algorithms.Math.factorial(num)
        assert result == 120
    end

    test "perfomance" do
        numbers = :lists.seq(1, 10 * 10 * 10 * 10 * 10)
        {time, result} = :timer.tc(fn -> Algorithms.Math.gcd(numbers) end)
        IO.puts "\nRunning perfomance tests..."
        IO.puts "~> GCD for #{length numbers} numbers is #{result}, time: #{time/1000}"
        numbers = :lists.reverse :lists.seq(1, 1000)
        {time, result} = :timer.tc(fn -> Algorithms.Sort.sleep(numbers) end)
        IO.puts "~> Sleep sort for #{length result} numbers, time: #{time/1000}"
    end

    test "sleep_sort" do
        numbers = [1, 2, 0, 10]
        result = Algorithms.Sort.sleep numbers
        assert result == [0, 1, 2, 10]
    end

end
