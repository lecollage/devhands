select * from orders limit 100;


explain
select
	*
from
	orders o
where
	o.o_custkey = 123;


EXPLAIN (analyze,buffers,timing) 
select
	*
from
	orders
where
	o_orderdate > '1996-01-01';
	
EXPLAIN (analyze,buffers,timing)
SELECT * FROM lineitem;

Seq Scan on lineitem  (cost=0.00..2070018.80 rows=71985080 width=117) (actual time=0.013..16735.517 rows=71985077 loops=1)
  Buffers: shared hit=12 read=1350156
Planning Time: 0.054 ms
Execution Time: 19763.283 ms



EXPLAIN (analyze,buffers,timing)
SELECT l_orderkey, l_partkey, l_quantity FROM lineitem;

Seq Scan on lineitem  (cost=0.00..2070018.80 rows=71985080 width=13) (actual time=10.630..10982.650 rows=71985077 loops=1)
  Buffers: shared hit=44 read=1350124
Planning Time: 0.057 ms
JIT:
  Functions: 2
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 0.270 ms (Deform 0.112 ms), Inlining 0.828 ms, Optimization 5.878 ms, Emission 3.903 ms, Total 10.879 ms
Execution Time: 13519.439 ms



EXPLAIN (analyze,buffers,timing)
select
	p_partkey,
	p_size,
	p_retailprice
from
	part
limit 10000;

Limit  (cost=0.00..552.05 rows=10000 width=14) (actual time=0.036..37.203 rows=10000 loops=1)
  Buffers: shared hit=51863
  ->  Seq Scan on part  (cost=0.00..132761.77 rows=2404877 width=14) (actual time=0.034..36.556 rows=10000 loops=1)
        Buffers: shared hit=51863
Planning Time: 0.084 ms
Execution Time: 37.581 ms


EXPLAIN (analyze,buffers,timing)
select
	p_partkey,
	p_size,
	p_retailprice,
	p_doc
from
	part
limit 10000;

Limit  (cost=0.00..552.05 rows=10000 width=32) (actual time=0.031..24.111 rows=10000 loops=1)
  Buffers: shared hit=51863
  ->  Seq Scan on part  (cost=0.00..132761.77 rows=2404877 width=32) (actual time=0.030..23.455 rows=10000 loops=1)
        Buffers: shared hit=51863
Planning Time: 0.067 ms
Execution Time: 24.462 ms


EXPLAIN (analyze,buffers,timing) 
select
	*
from
	orders
where
	o_orderdate = '1997-12-25';
	
Gather  (cost=1000.00..408991.50 rows=7455 width=107) (actual time=3.751..778.121 rows=7479 loops=1)
  Workers Planned: 2
  Workers Launched: 2
  Buffers: shared hit=350 read=313146
  ->  Parallel Seq Scan on orders  (cost=0.00..407246.00 rows=3106 width=107) (actual time=4.116..749.922 rows=2493 loops=3)
        Filter: (o_orderdate = '1997-12-25'::date)
        Rows Removed by Filter: 5997507
        Buffers: shared hit=350 read=313146
Planning:
  Buffers: shared hit=6
Planning Time: 0.117 ms
JIT:
  Functions: 6
  Options: Inlining false, Optimization false, Expressions true, Deforming true
  Timing: Generation 1.495 ms (Deform 0.408 ms), Inlining 0.000 ms, Optimization 0.784 ms, Emission 10.206 ms, Total 12.485 ms
Execution Time: 779.425 ms


EXPLAIN (analyze,buffers,timing)
select
	*
from
	orders
where
	o_orderdate = '1997-12-25';
	
                                                          QUERY PLAN                                                           
-------------------------------------------------------------------------------------------------------------------------------
 Seq Scan on orders  (cost=0.00..538496.00 rows=7455 width=107) (actual time=16.210..1166.069 rows=7479 loops=1)
   Filter: (o_orderdate = '1997-12-25'::date)
   Rows Removed by Filter: 17992521
   Buffers: shared hit=543 read=312953
 Planning:
   Buffers: shared hit=6
 Planning Time: 0.120 ms
 JIT:
   Functions: 2
   Options: Inlining true, Optimization true, Expressions true, Deforming true
   Timing: Generation 0.427 ms (Deform 0.135 ms), Inlining 2.042 ms, Optimization 8.247 ms, Emission 5.635 ms, Total 16.352 ms
 Execution Time: 1167.171 ms
(12 rows)



EXPLAIN (analyze,buffers,timing)
 select l_orderkey from lineitem where l_shipdate = '1996-12-01';
 

CREATE INDEX idx_lineitem_shipdate ON lineitem(l_shipdate);

Gather  (cost=1000.00..1728939.89 rows=28496 width=4) (actual time=35.793..5606.873 rows=30101 loops=1)
  Workers Planned: 2
  Workers Launched: 2
  Buffers: shared hit=29576 read=1320592
  ->  Parallel Seq Scan on lineitem  (cost=0.00..1725090.29 rows=11873 width=4) (actual time=118.952..5548.675 rows=10034 loops=3)
        Filter: (l_shipdate = '1996-12-01'::date)
        Rows Removed by Filter: 23984992
        Buffers: shared hit=29576 read=1320592
Planning:
  Buffers: shared hit=5 dirtied=1
Planning Time: 0.154 ms
JIT:
  Functions: 12
  Options: Inlining true, Optimization true, Expressions true, Deforming true
  Timing: Generation 1.328 ms (Deform 0.563 ms), Inlining 226.610 ms, Optimization 74.491 ms, Emission 54.290 ms, Total 356.718 ms
Execution Time: 5613.144 ms


