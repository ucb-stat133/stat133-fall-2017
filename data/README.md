## Data Sets

This folder contains most of the data sets used in lab sections and 
homework assignments.

-----

### `camping-tents.csv`

Data set of camping tents (stored in csv format) with the following variables:

- `name` (name of tent)
- `brand` (name of brand)
- `price` (price in dollars)
- `weight` (weights in grams)
- `height` (height in centimeters)
- `bestuse` (recommended use)
- `seasons` (number of seasons)
- `capacity` (sleep capacity)

Source: [REI](https://www.rei.com/b/rei/c/tents)

-----

### `cpds.csv`

Sample data from the "Comparative Political Data Set 1960-2010", stored in csv format,
with the following variables:

- `year` (period cover: 1960-2010)
- `country` (country name)
- `vturn` (voter turnout in election)
- `outlays` (Total outlays (disbursements) of general government as a percentage of GDP)
- `realgdpgr` (Growth of real GDP, percent change from previous year)
- `unemp` (Unemployment rate, percentage of civilian labour force)

Source: [http://www.cpds-data.org/index.php/data](http://www.cpds-data.org/index.php/data) by
Klaus Armingeon, Christian Isler, Laura Knöpfel, David Weisstanner, Sarah Engler.

-----

### `logfile.txt`

Sample (text) log file in [Common Log Format](https://en.wikipedia.org/wiki/Common_Log_Format)
with the following fields:

- IP address of the client (remote host) which made the request to the server.
- `-` missing user-identifier.
- `-` missing userid of the person requesting the document.
- date, time, and time zone that the request was received
- The method GET
- HTTP status code returned to the client.
- `-` missing size of the object returned to the client.

Source: Approximity. No longer available.

-----

### `mens-high-jump-raw.csv`

Raw data set of Men's High Jump World Records (as of Sep 2016), stored in csv format, 
with the following variables:

"Height","Athlete","Date","Place"

- `Height` (record in meters)
- `Athlete` (name of athlete and country)
- `Venue` (name of city, and sometimes state)
- `Date` (date in format %d %B %Y, with numbers inside brackets)

Source: [https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression](https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression)

-----

### `moible-food.csv`

Data set Mobile Food Schedule (stored in csv format) with the following variables:

- `DayOfWeekStr` (day of the week)
- `starttime` (starting time)
- `endtime` (end time)
- `PermitLocation` (address of permite location)
- `optionaltext` (description of the local and food)
- `ColdTruck` (whether it is a cold truck)
- `Applicant` (name of applicant)
- `Location` (latitude and longitude)

Source: [https://data.sfgov.org/Economy-and-Community/Mobile-Food-Schedule/jjew-r69b](https://data.sfgov.org/Economy-and-Community/Mobile-Food-Schedule/jjew-r69b)

-----

### `usa-states.RData`

Data stored in R binary format containing information about
the states and territories of the US.

- `state` (names of the States)
- `capital` (names of the capitals)
- `area` (total area in km2)
- `water` (water area in km2)
- `seats` (number of house seats)

Source: [https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States](https://en.wikipedia.org/wiki/List_of_states_and_territories_of_the_United_States)

-----

### `womens-high-jump-raw.csv`

Raw data set of Women's High Jump World Records (as of Sep 2016), stored in csv format, 
with the following variables:

"Height","Athlete","Date","Place"

- `Height` (record in meters)
- `Athlete` (name of athlete and country)
- `Date` (date in format %d %B %Y)
- `Place` (name of city with numbers inside brackets)

Source: [https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression](https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression)

-----

### `womens-high-jump-records.csv`

Data set of Women's High Jump World Records (as of Sep 2016), stored in csv format, 
with the following variables:

- `height` (record in meters)
- `first` (first name)
- `last` (last name)
- `country` (name of country)
- `day` (day of month, from record's date)
- `month` (name of month, from record's date)
- `year` (date year, from record's date)

Source: [https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression](https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression)

