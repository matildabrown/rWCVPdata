# The World Checklist of Vascular Plants: distributions

A dataset containing the distribution data from the WCVP, mapped to the
Biodiversity Information Standards (TDWG) World Geographical Scheme for
Recording Plant Distributions (WGSRPD)

## Usage

``` r
wcvp_distributions
```

## Format

A data frame with 1,950,339 rows and 11 variables:

- plant_locality_id:

  Sequential number.

- plant_name_id:

  World Checklist of Vascular Plants (WCVP) identifier

- continent_code_l1:

  WGSRPD Level 1 code.

- continent:

  WGSRPD Level 1 name.

- region_code_l2:

  WGSRPD Level 2 code.

- region:

  WGSRPD Level 2 name

- area_code_l3:

  WGSRPD Level 3 code

- area:

  WGSRPD name

- introduced:

  0 if native; 1 if introduced

- extinct:

  1 if extinct; 0 if extant

- location_doubtful:

  1 if doubtful; 0 otherwise

## Source

<http://sftp.kew.org/pub/data-repositories/WCVP/wcvp.zip>
