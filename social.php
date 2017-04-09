<?php

# skeleton code for the minimum path special node problem in php

function make_random_problem ($nodes, $edges, $special) {
  # seed the random number generator
  srand();

  # define special nodes
  $special = ($nodes > $special) ? $special : $nodes;
  $count = 0;
  while ($count < $special) {
    $this_rand = (int)rand(0, $nodes);
    $failed = 0;
    for ($i = 0; $i < $count && !$failed; $i++) {
      if ($spec[$i] == $this_rand) {
        $failed = 1;
      }
    }
    if (!$failed) {
      $spec[$count++] = $this_rand;
    }
  }

  # define edges
  $edges = ($nodes * $nodes < $edges) ? $nodes * $nodes : $edges;
  $count = 0;
  while ($count < $edges) {
    $this_edge[0] = (int)rand(0, $nodes);
    $this_edge[1] = (int)rand(0, $nodes);
    if ($this_edge[0] != $this_edge[1]) {
      $failed = 0;
      for ($i = 0; $i < $count && !$failed; $i++) {
        if (($edge[$i][0] == $this_edge[0] && $edge[$i][1] == $this_edge[1]) ||
            ($edge[$i][1] == $this_edge[0] && $edge[$i][0] == $this_edge[1])) {
          $failed = 1;
        }
      }
      if (!$failed) {
        $edge[$count][0] = $this_edge[0];
        $edge[$count][1] = $this_edge[1];
        $count++;
      }
    }
  }

  # export the values to global namespace
  $GLOBALS[num_nodes]   = $nodes;
  $GLOBALS[num_edges]   = $edges;
  $GLOBALS[num_special] = $special;
  $GLOBALS[spec]        = $spec;
  $GLOBALS[edge]        = $edge;

  return 0;
}

make_random_problem(10, 12, 3);

print "number of nodes: $num_nodes\n\n";

print "special nodes: ($num_special)\n";
for ($i = 0; $i < $num_special; $i++) {
  print $spec[$i] . "\n";
}

print "\nedges: ($num_edges)\n";
for ($i = 0; $i < $num_edges; $i++) {
  print $edge[$i][0] . "-" . $edge[$i][1] . "\n";
}

print "\n";

?>