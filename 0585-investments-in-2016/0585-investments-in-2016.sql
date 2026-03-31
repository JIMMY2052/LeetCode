select concat(lat,lon) as location from Insurance
group by concat(lat,lon)
having count(pid) = 1