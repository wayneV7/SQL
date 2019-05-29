
-- Spatial Types - geography   POINT
--http://www.earthpoint.us/Convert.aspx  to convert  lat and long  to sql use the degreese


-- The SQL Server geography data type stores ellipsoidal (round-earth) data,
-- such as GPS latitude and longitude coordinates.


-- A Point represents a singular position in space
--Define the position by using an X-coordinate and Y-coordinate value-pair 
--based on a planar coordinate system 
--or 
--on the latitude and longitude coordinates from a geographic coordinate system.


--For example, suppose we want to specify a Point in the Geometry data type with the coordinates
-- X = 5 and Y = 3. To define the Point, we can use the well-known text (WKT) format: POINT (5 3). 

--(WKT is a text markup language used to represent vector geometry objects.) 
--The WKT format starts with the POINT keyword, followed by the coordinate values, contained within parentheses and separated by a space.


Declare @PointA geometry;
		SET @PointA= geometry::STGeomFromText('POINT(35.848  014.517)',4326)

Declare @PointB geometry = geometry::STGeomFromText('POINT(35.869  14.512)',4326)


SELECT @PointA.STDistance(@PointB)/1000  as km ,
		 @PointA.STDistance(@PointB)/1609.344  as miles  




 

