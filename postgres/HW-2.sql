select count(c_mktsegment)
from
	customer;

EXPLAIN (ANALYZE, BUFFERS)
select c_mktsegment
from
	customer
where
	c_mktsegment = 'FURNITURE'
	and c_acctbal
between 4500 and 6700;	

rows=23848 
Rows Removed by Filter: 576152


select count(distinct c_mktsegment)
from
	customer;

count=5 
1/5=20%=0,2 (селективность)


select MAX(c_acctbal),MIN(c_acctbal)
from
	customer;
	
max |4008129.34|
min |-999.99   |

-1000..4008129 -> 4001129
between 4500 and 6700 -> 2200
2200/4001129=0,000549844806303=~0,00055 (селективность)

Общая селективность
0,2*0,00055=0,00011 (Высокая селективность)




EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM customer WHERE c_mktsegment = 'FURNITURE';

EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM customer WHERE c_acctbal BETWEEN 4500 AND 6700;





CREATE INDEX idx_customer_acctbal ON customer(c_acctbal);
CREATE INDEX idx_customer_mktsegment ON customer(c_mktsegment);
CREATE INDEX idx_customer_mkt_acctbal ON customer(c_mktsegment, c_acctbal);


EXPLAIN (ANALYZE, BUFFERS)
select c_mktsegment
from
	customer
where
	c_mktsegment = 'FURNITURE'
	and c_acctbal
between 4500 and 6700;	

-> with no index
Gather  (cost=1000.00..64403.30 rows=71683 width=11) (actual time=0.246..127.719 rows=71545 loops=1)
  Workers Planned: 2
  Workers Launched: 2
  Buffers: shared hit=43110
  ->  Parallel Seq Scan on customer  (cost=0.00..56235.00 rows=29868 width=11) (actual time=0.022..100.956 rows=23848 loops=3)
        Filter: ((c_acctbal >= '4500'::numeric) AND (c_acctbal <= '6700'::numeric) AND (c_mktsegment = 'FURNITURE'::bpchar))
        Rows Removed by Filter: 576152
        Buffers: shared hit=43110
Planning Time: 0.114 ms
Execution Time: 130.792 ms


-> index btree ON customer(c_acctbal)
Bitmap Heap Scan on customer  (cost=7637.10..57100.91 rows=71683 width=11) (actual time=42.760..174.308 rows=71545 loops=1)
  Recheck Cond: ((c_acctbal >= '4500'::numeric) AND (c_acctbal <= '6700'::numeric))
  Filter: (c_mktsegment = 'FURNITURE'::bpchar)
  Rows Removed by Filter: 287319
  Heap Blocks: exact=43105
  Buffers: shared hit=44088
  ->  Bitmap Index Scan on idx_customer_acctbal  (cost=0.00..7619.18 rows=363075 width=0) (actual time=36.096..36.097 rows=358864 loops=1)
        Index Cond: ((c_acctbal >= '4500'::numeric) AND (c_acctbal <= '6700'::numeric))
        Buffers: shared hit=983
Planning Time: 0.139 ms
Execution Time: 177.070 ms

-> index btree ON customer(c_mktsegment)
Bitmap Heap Scan on customer  (cost=3911.70..53240.85 rows=71683 width=11) (actual time=17.693..152.051 rows=71545 loops=1)
  Recheck Cond: (c_mktsegment = 'FURNITURE'::bpchar)
  Filter: ((c_acctbal >= '4500'::numeric) AND (c_acctbal <= '6700'::numeric))
  Rows Removed by Filter: 287706
  Heap Blocks: exact=43106
  Buffers: shared hit=43416
  ->  Bitmap Index Scan on idx_customer_mktsegment  (cost=0.00..3893.78 rows=355380 width=0) (actual time=10.831..10.832 rows=359251 loops=1)
        Index Cond: (c_mktsegment = 'FURNITURE'::bpchar)
        Buffers: shared hit=310
Planning Time: 0.119 ms
Execution Time: 154.940 ms


-> composite index btree ON customer(c_mktsegment, c_acctbal);
Index Only Scan using idx_customer_mkt_acctbal on customer  (cost=0.43..3072.49 rows=71683 width=11) (actual time=0.033..11.848 rows=71545 loops=1)
  Index Cond: ((c_mktsegment = 'FURNITURE'::bpchar) AND (c_acctbal >= '4500'::numeric) AND (c_acctbal <= '6700'::numeric))
  Heap Fetches: 13
  Buffers: shared hit=26501
Planning Time: 0.117 ms
Execution Time: 14.713 ms



