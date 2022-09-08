/*** Monthly Airline Delay Query ***/
SELECT DATEPART(, month, Airlines.code, Airlines.description AS name, avg_dep_delay, avg_arr_delay
FROM Flights
LEFT JOIN Airlines
ON Flights.airline=Airlines.code
ORDER BY year, month, Airlines.code, Airlines.description

/*** Monthly Airport Origin Query ***/
SELECT year, month, Airports.code, Airports.name AS name, avg_dep_delay, avg_arr_delay
FROM flights_monthly
LEFT JOIN Airports
ON flights_monthly.airline=Airlines.code
ORDER BY year, month, Airlines.code, Airlines.description