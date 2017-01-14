--declare @start date = '2013-01-01', @end date = '2016-08-31' ;
--declare @start date = '2013-07-01', @end date = '2013-12-31' ;
--declare @start date = '2014-01-01', @end date = '2014-06-30' ;
--declare @start date = '2014-01-01', @end date = '2014-12-31' ;
--declare @start date = '2015-01-01', @end date = '2015-06-30' ;
--declare @start date = '2015-07-01', @end date = '2015-12-31' ;
--declare @start date = '2016-01-01', @end date = '2016-05-31' ;
declare @start date = '2017-07-01', @end date = '2017-07-31' ;
--declare @start date = '2014-01-01', @end date = '2014-05-31' ;


if object_id( 'tempdb..#changes' ) is not null drop table #changes ;

select 
	c.ordnum, custid = c.scustid, sprnum = m.sprnum
into 
	#changes
from 
	custinfo AS c 
INNER JOIN 
	masterln AS m 
		on m.ordnum = c.ordnum
where
	c.[date] between @start and @end
UNION
SELECT
	c.ordnum, custid = bcustid, sprnum = m.sprnum
from 
	custinfo AS c 
INNER JOIN 
	masterln AS m 
		on m.ordnum = c.ordnum
where
	c.[date] between @start and @end ;

update custinfo 
set shipdate = shipdate
where ordnum in ( select distinct ordnum from #changes ) ; 

update masterln
set quan = quan 
where ordnum in ( select distinct ordnum from #changes ) ; 

update cmaster
set country = country 
where custid in ( select distinct custid from #changes ) ; 

update parts
set [desc] = [desc]
WHERE sprnum in ( select distinct sprnum from #changes ) ; 



