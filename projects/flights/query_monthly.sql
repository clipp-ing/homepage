USE flight_delays

/*** Monthly Airline Delays ***/
SELECT DATEPART(Year, date) AS year, 
	DATEPART(Month, date) AS month, 
	airline, 
	Airlines.description AS name, 
	COUNT(airline) as num_flights,
	AVG(dep_delay) as avg_dep_delay, 
	AVG(arr_delay) AS avg_arr_delay,
	AVG(distance) as avg_distance,
	STDEV(distance) as stdev_distance
FROM Flights
LEFT JOIN Airlines
ON Flights.airline=Airlines.code
GROUP BY DATEPART(Year, date), DATEPART(Month, date), airline, Airlines.description
ORDER BY DATEPART(Year, date), DATEPART(Month, date), airline
GO

/*** Monthly Airport Origin ***/
SELECT DATEPART(Year, date) as year, 
	DATEPART(Month, date) as month, 
	origin as origin_airport, 
	Airports.city as origin_city, 
	Airports.state as origin_state,
	COUNT(origin) as num_flights,
	AVG(dep_delay) as avg_dep_delay,
	AVG(arr_delay) as avg_arr_delay,
	AVG(crs_elapsed_time) as avg_crs_elapsed_time,
	AVG(actual_elapsed_time) as avg_elapsed_time
FROM Flights
LEFT JOIN Airports
ON Flights.origin=Airports.code
GROUP BY DATEPART(Year, date), DATEPART(Month, date), origin, Airports.city, Airports.state
ORDER BY DATEPART(Year, date), DATEPART(Month, date), origin
GO

/*** Monthly Airport Destination ***/
SELECT DATEPART(Year, date) as year, 
	DATEPART(Month, date) as month, 
	destination as destination_airport, 
	Airports.city as destination_city, 
	Airports.state as destination_state,
	count(destination) as num_flights,
	AVG(dep_delay) as avg_dep_delay,
	AVG(arr_delay) as avg_arr_delay,
	AVG(crs_elapsed_time) as avg_crs_elapsed_time,
	AVG(actual_elapsed_time) as avg_elapsed_time
FROM Flights
LEFT JOIN Airports
ON Flights.destination=Airports.code
GROUP BY DATEPART(Year, date), DATEPART(Month, date), destination, destination, Airports.city, Airports.state
ORDER BY DATEPART(Year, date), DATEPART(Month, date), destination
GO
