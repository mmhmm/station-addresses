# station-addresses

A CSV list of station codes ("CRS codes") and names can be downloaded from a link
on http://www.nationalrail.co.uk/stations_destinations/48541.aspx

- http://www.nationalrail.co.uk/static/documents/content/station_codes.csv

The list was last updated 30/01/2017.

Known omissions are:

- Cambridge North (CMB)

The script scrapes the station details pages on the National Rail website to find
the street address and postcode for each entry in the codes CSV, and creates an
CSV `output.csv` in the following format:

``CRS Code,Station Name,Postcode,Street Address``

The components of the Street Address will be comma separated so this field will
be string quoted.

Known issues:

- Barbican (ZBB) is included in the codes list, but the station has no page on
  the National Rail site as it no longer has National Rail services.
- High Street Kensington Underground (ZHS) is included and also has no page.
- Elephant & Castle (Underground) (ZEL) is included and does have a page. EPH is
  the code for Elephant & Castle National Rail station. Both have pages and the
  same postcode.

