# The World Checklist of Vascular Plants: names

A dataset containing the taxonomic data from the WCVP.

## Usage

``` r
wcvp_names
```

## Format

A data frame with 1,415,007 rows and 31 variables:

- plant_name_id:

  World Checklist of Vascular Plants (WCVP) identifier

- ipni_id:

  International Plant Name Index (IPNI) identifier. Missing values
  indicate that the name has not been matched with a name in IPNI.

- taxon_rank:

  The level in the taxonomic hierarchy where the taxon nname fits. Some
  infraspecific names are unranked and will have no value iin this
  column.

- taxon_status:

  Indication of taxonomic opinion re the name.

- family:

  The name of the family to which the taxon belongs. (The highest rank
  at which names are presented in WCVP).

- genus_hybrid:

  Indication of hybrid status at genus level: \\ indicates a
  graft-chimaera and × indicates a hybrid.

- genus:

  The name of the genus to which the record refers.

- species_hybrid:

  Indication of hybrid status at species level: \\ indicates a
  graft-chimaera and × indicates a hybrid.

- species:

  The species epithet which is combined with the genus name to make a
  binomial name for a species. Empty when the taxon name is at the rank
  of genus.

- infraspecific_rank:

  The taxonomic rank of the infraspecific epithet. Empty where the taxon
  name is species rank or higher. For more information, see the
  International Code of Nomenclature for algae, fungi and plants:
  https://www.iapt-taxon.org/nomen/main.php

- infraspecies:

  The infraspecific epithet which is combined with a binomial to make a
  trinomial name at infraspecific rank. Empty when taxon name is at
  species rank or higher.

- parenthetical_author:

  The author or authors responsible for publication of the original
  scientific name. Empty when no name change has occurred.

- primary_author:

  The author or authors responsible for publication of the scientific
  name. Missing values indicate instances where authorship is unknown or
  non-applicable (e.g. autonyms).

- publication_author:

  The author or authors of the publication where the scientific name is
  first published (may be different from primary author if e.g.
  described in a book). Missing values indicate instances where
  publication details are unknown or non-applicable (e.g. for autonyms).

- place_of_publication:

  The journal, bulletin or other publication that the taxon name was
  first published in. Missing values indicate instances where
  publication details are unknown or non-applicable (e.g. for autonyms).

- volume_and_page:

  The volume and page numbers of the original publication of the taxon
  name, where "5(6): 36" is volume 5, issue 6, page 36. Missing values
  indicate instances where publication details are unknown or
  non-applicable (e.g. for autonyms).

- first_published:

  The year of publication of the taxon name, enclosed in parentheses.
  Missing values indicate instances where publication details are
  unknown or non-applicable (e.g. for autonyms).

- nomenclatural_remarks:

  Remarks on the nomenclature.

- geographic_area:

  The geographic distribution of the taxon (for names of species rank or
  below): a generalised statement in narrative form.

- lifeform_description:

  The lifeform (or lifeforms) of the taxon. Terms refer to a modified
  verison of the Raunkiær system. Where there are multiple lifeforms,
  the most common is listed first. Missing values if unknown.

- climate_description:

  Habitat type of the taxon, derived from published habitat information.

- taxon_name:

  Concatenation of genus with species and, where applicable,
  infraspecific epithets to make a binomial or trinomial name.

- taxon_authors:

  Concatenation of parenthetical and primary authors. Missing values
  indicate instances where authorship is unknown or non-applicable (e.g.
  autonyms).

- accepted_plant_name_id:

  The ID of the accepted name of this taxon. Where the taxon_status is
  "Accepted", this will be identical to the plant_name_id value. May be
  empty if taxon status is unplaced, ilegitimate, or in some cases where
  the accepted name is not a vascular plant (e.g. a moss, alga or
  animal).

- basionym_plant_name_id:

  ID of the original name that taxon_name was derived from (i.e. the
  basionym). Empty if there have been no name changes.

- replaced_synonym_author:

  The author or authors responsible for publication of the replaced
  synonym. Empty when the name is not a replacement name based on
  another name.

- homotypic_synonym:

  The synonym type - TRUE if homotypic synonym, otherwise NA.

- parent_plant_name_id:

  ID for the parent genus or parent species of an accepted species or
  infraspecific name. Empty for non accepted names or where the parent
  has not yet been calculated.

- powo_id:

  Identifier required to look up the name directly in Plants of the
  World Online (POWO).

- hybrid_formula:

  Parents of hybrid.

- reviewed:

  Flag indicating whether the family to which the taxon belongs has been
  peer reviewed.

## Source

<http://sftp.kew.org/pub/data-repositories/WCVP/wcvp.zip>
