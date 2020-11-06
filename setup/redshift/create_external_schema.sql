-- create_external_schema.sql
create external schema spectrum 
from data catalog 
database 'spectrumdb' 
<<<<<<< HEAD
iam_role '<your-iam-Role-ARN>'
=======
iam_role 'arn:aws:iam::705227284300:role/mySpectrumRole'
>>>>>>> starter
create external database if not exists;

-- user purchase staging table with an insert_date partition
drop table if exists spectrum.user_purchase_staging;
create external table spectrum.user_purchase_staging (
    InvoiceNo varchar(10),
    StockCode varchar(20),
    detail varchar(1000),
    Quantity integer,
    InvoiceDate timestamp,
    UnitPrice decimal(8,3),
    customerid integer,
    Country varchar(20)
)
partitioned by (insert_date date)
row format delimited fields terminated by ','
stored as textfile
<<<<<<< HEAD
location 's3://<your-s3-bucket>/user_purchase/stage/'
=======
location 's3://trevspectrumbucket/user_purchase/stage/'
>>>>>>> starter
table properties ('skip.header.line.count'='1');

-- movie review staging table
drop table if exists spectrum.movie_review_clean_stage;
CREATE EXTERNAL TABLE spectrum.movie_review_clean_stage (
   cid varchar(100),
   positive_review boolean
)
STORED AS PARQUET
<<<<<<< HEAD
LOCATION 's3://<your-s3-bucket>/movie_review/stage/';
=======
LOCATION 's3://trevspectrumbucket/movie_review/stage/';
>>>>>>> starter

-- user behaviour metric tabls
DROP TABLE IF EXISTS public.user_behavior_metric;
CREATE TABLE public.user_behavior_metric (
    customerid integer,
    amount_spent decimal(18, 5),
    review_score integer,
    review_count integer,
    insert_date date
);
