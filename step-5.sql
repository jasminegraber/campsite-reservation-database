/*
 STEP ONE: Add a new park with the following data:
  ------------------------------
  name: Ohiopyle State Park
  location: Pennsylvania
  establish date: 1965-01-01
  area: 19052
  visitors: 1000000
  description: Ohiopyle State Park is a Pennsylvania state park on 19,052 acres in Dunbar, Henry Clay and Stewart Townships, Fayette County, Pennsylvania in the United States. The focal point of the park is the more than 14 miles of the Youghiogheny River Gorge that passes through the park.
  ------------------------------
*/

INSERT INTO park (name, location, establish_date, area, visitors, description)
VALUES ('Ohiopyle State Park', 'Pennsylvania', '1965-01-01', 19052, 1000000, 'Ohiopyle State Park is a Pennsylvania state park on 19,052 acres in Dunbar, Henry Clay and Stewart Townships, Fayette County, Pennsylvania in the United States. The focal point of the park is the more than 14 miles of the Youghiogheny River Gorge that passes through the park.')
;

/*
  STEP TWO: You just found out that there was an error with the park data. Please update the park visitors to 1.5 million anually.

*/

UPDATE park
SET visitors = 1500000
WHERE name = 'Ohiopyle State Park'
;

/*
 STEP THREE: Insert new campground with the following data:
  ------------------------------------------------------------
  park_id: 4 (this should be the id of the new park you just added)
  name: Youghiogheny
  open_from_mm: 01
  open_to_mm: 12
  daily_fee: 95.00
  ------------------------------------------------------------
*/

INSERT INTO campground (park_id, name, open_from_mm, open_to_mm, daily_fee)
VALUES ((SELECT park_id FROM park WHERE name = 'Ohiopyle State Park'), 'Youghiogheny', '01', '12', '95')
;


/*
 STEP FOUR: Insert 3 new sites with the following data:
 ------------------------------------------------------------
  site_number: 623, campground_id: 9
  site_number: 624, campground_id: 9
  site_number: 625, campground_id: 9
 ------------------------------------------------------------

 > campground_id 9 should be the id of the campground you just added 'Youghiogheny'
 
 **** NOTE added and deleted so ended up making a site_id 9 ****

*/
INSERT INTO site (site_number, campground_id)
VALUES (623, (SELECT campground_id FROM campground WHERE name = 'Youghiogheny')), 
       (624, (SELECT campground_id FROM campground WHERE name = 'Youghiogheny')), 
       (625, (SELECT campground_id FROM campground WHERE name = 'Youghiogheny'))
;




/*
 STEP FIVE: Insert 3 reservations, 1 for each site with the following data:
------------------------------------------------------------------------------------
  site_id: 623, name: Wayne Family, from_date: today + 10 days, to_date: today + 20 days
  site_id: 624, name: Parker Family, from_date: today + 11 days, to_date: today + 20 days
  site_id: 625, name: Kent Family, from_date: today + 12 days, to_date: today + 20 days
------------------------------------------------------------------------------------

*/
INSERT INTO reservation (reservation_id, site_id, name, from_date, to_date, create_date)
VALUES (DEFAULT, (SELECT campground_id FROM campground WHERE name = 'Youghiogheny'), 'Wayne Family', '2021-06-13', '2021-06-13', '2021-06-13'),
       (DEFAULT, (SELECT campground_id FROM campground WHERE name = 'Youghiogheny'), 'Parker Family', '2021-06-13', '2021-06-13', '2021-06-13'),
       (DEFAULT, (SELECT campground_id FROM campground WHERE name = 'Youghiogheny'), 'Kent Family', '2021-06-13', '2021-06-13', '2021-06-13');

UPDATE reservation
SET from_date = from_date + 10
WHERE name = 'Wayne Family';

UPDATE reservation
SET to_date = to_date + 20
WHERE name = 'Wayne Family';

UPDATE reservation
SET from_date = from_date + 11
WHERE name = 'Parker Family';

UPDATE reservation
SET to_date = to_date + 20
WHERE name = 'Parker Family';

UPDATE reservation
SET from_date = from_date + 12
WHERE name = 'Kent Family';

UPDATE reservation
SET to_date = to_date + 20
WHERE name = 'Kent Family';


/*
 STEP SIX: The Wayne Family called and asked if they could change their reservation to today. Update the from_date to today and the to_date to a week from today.

 */
UPDATE reservation
SET from_date = '2021-06-13'
WHERE name = 'Wayne Family';

UPDATE reservation
SET to_date = from_date + 7
WHERE name = 'Wayne Family';


/*
 STEP SEVEN: The Kent family called and they would like to cancel their reservation. Delete the reservation for Kent Family.

*/
DELETE FROM reservation
WHERE name = 'Kent Family';

