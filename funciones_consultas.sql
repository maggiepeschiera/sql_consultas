//retraso promedio de departures y arrives segun el aeropuerto de origen//

SELECT Origin, AVG(ArrDelay) AS 'prom_ArrDelay', AVG(DepDelay) AS 'prom_DepDelay'
FROM Flights
GROUP BY Origin


//Retraso promedio de llegada de los vuelos, por meses y según el aeropuerto origen//

SELECT Origin AS 'Origin', colYear AS 'Year', colMonth AS 'Month', AVG(ArrDelay) AS 'prom_ArrDelay'
FROM Flights
GROUP BY Origin, colYear, colMonth


//Retraso promedio de llegada de los vuelos, por meses y según el aeropuerto origen
(misma consulta que antes y con el mismo orden).
Pero además, ahora quieren que en vez del código del aeropuerto se muestra el nombre de la ciudad//

SELECT USAirports.City AS 'City', colYear AS 'Year', colMonth AS 'Month', AVG(ArrDelay) AS 'prom_ArrDelay'
FROM Flights
LEFT JOIN USAirports ON Flights.Origin = USAirports.IATA
GROUP BY City, colYear, colMonth


//Las compañías con más vuelos cancelados. Además,
deben estar ordenadas de forma que las compañías con más cancelaciones
aparezcan las primeras//

SELECT UniqueCarrier, colYear AS 'Year', colMonth AS 'Month', AVG(ArrDelay) AS 'avg_ArrDelay',
Cancelled AS 'Total_cancelled'
FROM Flights
INNER JOIN Carriers ON Flights.UniqueCarrier=Carriers.CarrierCode
WHERE Cancelled >=1
GROUP BY UniqueCarrier, colYear,colMonth, Cancelled
ORDER BY UniqueCarrier, colYear, colMonth, Cancelled DESC


//El identificador de los diez aviones que más distancia han recorrido haciendo vuelos//

SELECT TailNum, Distance AS 'Total_distance'
FROM Flights
GROUP BY TailNum
ORDER BY Distance DESC
LIMIT 10


//Compañías con su retraso promedio sólo de aquellas las que sus vuelos
llegan a su destino con un retraso promedio mayor de diez minutos//

SELECT UniqueCarrier, AVG(ArrDelay) AS 'avg_Delay'
FROM Flights
GROUP BY UniqueCarrier HAVING AVG(ArrDelay) >10
