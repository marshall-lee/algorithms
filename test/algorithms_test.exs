Code.require_file "test_helper.exs", __DIR__

defmodule MathTest do
    use ExUnit.Case, async: true

    import Algorithms.Math

    test "gcd" do
        result = gcd [105, 70, 35, 15]
        assert result == 5
    end

    test "lcm" do
        result = lcm [3, 4, 20]
        assert result == 60
    end

    test "factorial" do
        assert factorial(5) == 120
    end

    test "binary pow" do
        assert binpow(16, 2) == 256
        assert binpow(8, 8) == 16777216
    end

    test "square" do
        result = square 4
        assert result == 16
    end

end

defmodule SortTest do
    use ExUnit.Case, async: true

    import Algorithms.Sort

    test "sleepsort" do
        result = sleep([1, 2, 0, 10])
        assert result == [0, 1, 2, 10]
    end

    test "quicksort" do
        result = quick([12, 0, 1, 8, 10])
        assert result == [0, 1, 8, 10, 12]
    end

    test "mergesort" do
      result = merge_sort([12, 0, 1, 8, 10, 2, 3, 4, 3])
      assert result == [0, 1, 2, 3, 3, 4, 8, 10, 12]
    end

    test "bubblesort" do
      result = bubble([10, 2, 3, 8, 12, 11])
      assert result == [2, 3, 8, 10, 11, 12]
    end
end

defmodule SearchTest do
    use ExUnit.Case, async: true

    import Algorithms.Search

    test "binary" do
        {state, result} = binary [22, 32, 42, 52, 62], 52
        assert {state, result} == {:ok, 4}
    end

    test "binary error handing" do
        {state, result} = binary [18, 28, 38], 1337
        assert {state, result} == {:error, -1}
    end

    test "ne item binary" do
        {state, result} = binary [22, 32, 42, 52, 62], 1337
        assert {state, result} == {:error, -1}
    end

    test "deep first search" do
      cpp = Algorithms.Node.new(name: "C++")
      erlang = Algorithms.Node.new(name: "Erlang")
      {:ok, cpp} = Algorithms.Node.append(cpp, [erlang])
      graph = Algorithms.Graph.new(nodes: [cpp])
      {state, node, path} = dfs(graph, erlang)
      assert state == :ok
      assert node == erlang
      assert path == [cpp, erlang]
      elixir = Algorithms.Node.new(name: "Elixir")
      {state, node} = dfs(graph, elixir)
      assert state == :error
      assert node == elixir
    end

    test "more complex DFS" do
      grandfather = Algorithms.Node.new(name: "Richard")
      grandmother = Algorithms.Node.new(name: "Violett")
      father = Algorithms.Node.new(name: "Bob")
      mother = Algorithms.Node.new(name: "Alice")
      son = Algorithms.Node.new(name: "Charlie")
      {:ok, mother} = Algorithms.Node.append(mother, [son])
      {:ok, grandfather} = Algorithms.Node.append(grandfather, [mother])
      {:ok, grandmother} = Algorithms.Node.append(grandmother, [father])
      family = Algorithms.Graph.new(nodes: [grandfather, grandmother])
      {:ok, _, path} = dfs(family, son)
      assert path == [grandfather, mother, son]
      {:ok, _, path} = dfs(family, grandmother)
      assert path == [grandmother]
    end

end

defmodule GraphTest do
    use ExUnit.Case, async: true

    test "create graph" do
        graph = Algorithms.Graph.new(nodes: [1, 2, 3])
        assert graph.nodes == [1, 2, 3]
    end

    test "insert node to graph" do
        first_node = Algorithms.Node.new(name: "Head")
        second_node = Algorithms.Node.new(name: "Tail")
        graph = Algorithms.Graph.new(nodes: [first_node, second_node])
        assert graph.nodes == [first_node, second_node]
    end

    test "remove node from graph" do
        node = Algorithms.Node.new(name: "Head")
        graph = Algorithms.Graph.new(nodes: [node])
        {:ok, graph} = Algorithms.Graph.remove(graph, node)
        assert graph.nodes == []
    end

    test "create node" do
        node = Algorithms.Node.new(name: "Python", nodes: ["PyPy"])
        assert node.name == "Python"
        assert node.nodes == ["PyPy"]
    end

    test "append children to node" do
        node = Algorithms.Node.new(name: "Python", nodes: [])
        first_node = Algorithms.Node.new(name: "Head")
        second_node = Algorithms.Node.new(name: "Tail")
        {:ok, node} = Algorithms.Node.append(node, [first_node, second_node])
        assert node.nodes == [first_node, second_node]
    end
end
