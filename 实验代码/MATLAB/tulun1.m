weight=    [0     8   Inf   Inf   Inf   Inf     7     8   Inf   Inf   Inf;
   Inf     0     3   Inf   Inf   Inf   Inf   Inf   Inf   Inf   Inf;
   Inf   Inf     0     5     6   Inf     5   Inf   Inf   Inf   Inf;
   Inf   Inf   Inf     0     1   Inf   Inf   Inf   Inf   Inf    12;
   Inf   Inf     6   Inf     0     2   Inf   Inf   Inf   Inf    10;
   Inf   Inf   Inf   Inf     2     0     9   Inf     3   Inf   Inf;
   Inf   Inf   Inf   Inf   Inf     9     0   Inf   Inf   Inf   Inf;
     8   Inf   Inf   Inf   Inf   Inf   Inf     0     9   Inf   Inf;
   Inf   Inf   Inf   Inf     7   Inf   Inf     9     0     2   Inf;
   Inf   Inf   Inf   Inf   Inf   Inf   Inf   Inf     2     0     2;
   Inf   Inf   Inf   Inf    10   Inf   Inf   Inf   Inf   Inf     0;];
[dis, path]=dijkstra(weight,1, 11)