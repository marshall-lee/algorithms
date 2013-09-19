defmodule Algorithms do

    @moduledoc """
    Collection of algorithms, inspired by nryoung/algorithms
    """

    defrecord Graph, nodes: [] do

        @doc """
        Appends given node to graph. Returns state (`:ok`) and new graph record.
        """

        def append(graph, []) do
            {:ok, graph}
        end

        def append(graph, [head|tail]) do
            {:ok, graph} = append(graph, head)
            append(graph, tail)
        end

        def append(graph, node) do
            nodes = graph.nodes ++ [node]
            {:ok, Graph.new(nodes: nodes)}
        end

        @doc """
        Removes given node from graph. As `append` function, returns state and new graph.
        """

        def remove(graph, []) do
            {:ok, graph}
        end

        def remove(graph, [head|tail]) do
            {:ok, graph} = remove(graph, head)
            remove(graph, tail)
        end

        def remove(graph, node) do
            nodes = graph.nodes -- [node]
            {:ok, Graph.new(nodes: nodes)}
        end

    end

    defrecord Node, name: nil, nodes: [] do

        def append(parent, []) do
            {:ok, parent}
        end

        def append(parent, [head|tail]) do
            {:ok, parent} = append(parent, head)
            append(parent, tail)
        end

        def append(parent, node) do
            nodes = parent.nodes ++ [node]
            {:ok, Node.new(name: parent.name, nodes: nodes)}
        end

        def remove(parent, []) do
            {:ok, parent}
        end

        def remove(parent, [head|tail]) do
            {:ok, parent} = remove(parent, head)
            remove(parent, tail)
        end

        def remove(parent, node) do
            nodes = parent.nodes -- node
            {:ok, Node.new(name: parent.name, nodes: nodes)}
        end

    end
end
