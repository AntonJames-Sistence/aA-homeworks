class GraphNode
    attr_reader :node_name
    attr_accessor :neighbors
    def initialize(node_name)
        @node_name
        @neighbors = []
    end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(starting_node, target_value)
    return nil if starting_node.neighbors.empty?
    return target_value if starting_node == target_value

    starting_node.neighbors.each do |neighbor|
        bfs(neighbor, target_value)
    end
    nil
end

p bfs(a, "b")