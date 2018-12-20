class ScoreCalculator
  MAX_VALUE = Float::INFINITY
  VERTICES = 6
  NODES = [1, 2, 3, 4, 5, 6] # number of NODES
  GRAPH = [[1, 2, 5],
    [2, 3, 7],
    [2, 4, 3],
    [3, 5, 4],
    [4, 5, 10],
    [4, 6, 8]]
  NODE_TO_NUMBER = {
    A: 1,
    B: 2,
    C: 3,
    D: 4,
    E: 5,
    F: 6
  }

  # The score is calculated from the formula:
  # score = ( n + d )/2
  # n = 100 - 25 * | nv - nc |
  #
  # where d is the distance between the candidate and vacancy,
  # nv is the vacancy level and nc candidate level
  def self.calculate(candidate_level, vacancy_level, candidate_dist, vacancy_dist)
    candidate_number = NODE_TO_NUMBER[candidate_dist.to_sym]
    vacancy_number = NODE_TO_NUMBER[vacancy_dist.to_sym]

    case shorter_distance_between(candidate_number, vacancy_number)
    when 0..5
      d = 100
    when 5..10
      d = 75
    when 10..15
      d = 50
    when 15..20
      d = 25
    else
      d = 0
    end

    n = 100 - ( 25 * ( candidate_level - vacancy_level).abs )
    ( n + d )/2
  end


  # method based in Dijkstra Algoritm
  def self.shorter_distance_between(candidate, company)
    if candidate < company
      start = candidate
      final = company
    else
      start = company
      final = candidate
    end

    graph = GRAPH.dup
    matrix_of_road = graph.unshift([VERTICES])
    nodes = NODES.dup
    road = Hash.new(nodes)
    r = Hash.new(nodes)
    s = Hash.new(nodes)
    f = Hash.new(nodes)

    # zeroing the values of r, s and f
    nodes.each do |i|
      r[i] = 0
      s[i] = 0
      f[i] = 0
    end

    # assigning maximum value to all possible paths
    nodes.each do |i|
      nodes.each do |j|
        if i == j
          road[[i, j]] = 0
        else
          road[[i, j]] = MAX_VALUE
        end
      end
    end

    # assigning weight to vertices
    (1..VERTICES).each do |i|
      x = matrix_of_road[i][0]
      y = matrix_of_road[i][1]
      c = matrix_of_road[i][2]
      road[[x, y]] = c
    end

    min = MAX_VALUE
    pos_min = MAX_VALUE

    nodes.each do |i|
      r[i] = road[[start, i]]
      f[i] = start if i != start && r[i] < MAX_VALUE
    end

    s[start] = 1

    nodes[0..nodes.size - 2].each do
      min = MAX_VALUE

      nodes.each do |i|
        if s[i] == 0 && r[i] < min
          min = r[i]
          pos_min = i
        end
      end

      s[pos_min] = 1

      nodes.each do|j|
        if s[j] == 0
          if r[j] > r[pos_min] + road[[pos_min, j]]
            r[j] = r[pos_min] + road[[pos_min, j]]
            f[j] = pos_min
          end
        end
      end
    end

    r[final]
  end
end
