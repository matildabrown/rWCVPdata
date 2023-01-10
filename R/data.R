#' The World Checklist of Vascular Plants: names
#'
#' A dataset containing the taxonomic data from the WCVP.
#'
#' @format A data frame with 1,415,007 rows and 31 variables:
#' \describe{
#'   \item{plant_name_id}{World Checklist of Vascular Plants (WCVP) identifier}
#'   \item{ipni_id}{International Plant Name Index (IPNI) identifier. Missing
#'   values indicate that the name has not been matched with a name in IPNI.}
#'   \item{taxon_rank}{The level in the taxonomic hierarchy where the taxon
#'   nname fits. Some infraspecific names are unranked and will have no value
#'   iin this column.}
#'   \item{taxon_status}{Indication of taxonomic opinion re the name.}
#'   \item{family}{The name of the family to which the taxon belongs. (The
#'   highest rank at which names are presented in WCVP).}
#'   \item{genus_hybrid}{Indication of hybrid status at genus level:
#'   + indicates a graft-chimaera and × indicates a hybrid.}
#'   \item{genus}{The name of the genus to which the record refers.}
#'   \item{species_hybrid}{Indication of hybrid status at species level:
#'   + indicates a graft-chimaera and × indicates a hybrid.}
#'   \item{species}{The species epithet which is combined with the genus name
#'   to make a binomial name for a species. Empty when the taxon name is at the
#'   rank of genus.}
#'   \item{infraspecific_rank}{The taxonomic rank of the infraspecific epithet.
#'   Empty where the taxon name is species rank or higher. For more information,
#'   see the International Code of Nomenclature for algae, fungi and plants:
#'   https://www.iapt-taxon.org/nomen/main.php}
#'   \item{infraspecies}{The infraspecific epithet which is combined with a
#'   binomial to make a trinomial name at infraspecific rank. Empty when taxon
#'   name is at species rank or higher. }
#'   \item{parenthetical_author}{The author or authors responsible for
#'   publication of the original scientific name. Empty when no name change has
#'   occurred. }
#'   \item{primary_author}{The author or authors responsible for publication of
#'   the scientific name. Missing values indicate instances where authorship is
#'   unknown or non-applicable (e.g. autonyms). }
#'   \item{publication_author}{The author or authors of the publication where
#'   the scientific name is first published (may be different from primary
#'   author if e.g. described in a book). Missing values indicate instances
#'   where publication details are unknown or non-applicable (e.g. for
#'   autonyms). }
#'   \item{place_of_publication}{The journal, bulletin or other publication
#'   that the taxon name was first published in. Missing values indicate
#'   instances where publication details are unknown or non-applicable (e.g.
#'   for autonyms). }
#'   \item{volume_and_page}{The volume and page numbers of the original
#'   publication of the taxon name, where "5(6): 36" is volume 5, issue 6, page
#'   36. Missing values indicate instances where publication details are unknown
#'   or non-applicable (e.g. for autonyms). }
#'   \item{first_published}{The year of publication of the taxon name, enclosed
#'   in parentheses. Missing values indicate instances where publication details
#'   are unknown or non-applicable (e.g. for autonyms). }
#'   \item{nomenclatural_remarks}{Remarks on the nomenclature. }
#'   \item{geographic_area}{The geographic distribution of the taxon (for names
#'   of species rank or below): a generalised statement in narrative form.}
#'   \item{lifeform_description}{The lifeform (or lifeforms) of the taxon. Terms
#'   refer to a modified verison of the Raunkiær system. Where there are
#'   multiple lifeforms, the most common is listed first. Missing values if
#'   unknown. }
#'   \item{climate_description}{Habitat type of the taxon, derived from
#'   published habitat information. }
#'   \item{taxon_name}{Concatenation of genus with species and, where
#'   applicable, infraspecific epithets to make a binomial or trinomial name.}
#'   \item{taxon_authors}{Concatenation of parenthetical and primary authors.
#'   Missing values indicate instances where authorship is unknown or
#'   non-applicable (e.g. autonyms). }
#'   \item{accepted_plant_name_id}{The ID of the accepted name of this taxon.
#'   Where the taxon_status is "Accepted", this will be identical to the
#'   plant_name_id value. May be empty if taxon status is unplaced, ilegitimate,
#'   or in some cases where the accepted name is not a vascular plant (e.g. a
#'   moss, alga or animal).}
#'   \item{basionym_plant_name_id}{ID of the original name that taxon_name was
#'   derived from (i.e. the basionym). Empty if there have been no name changes.}
#'   \item{replaced_synonym_author}{The author or authors responsible for
#'   publication of the replaced synonym. Empty when the name is not a
#'   replacement name based on another name.}
#'   \item{homotypic_synonym}{The synonym type - TRUE if homotypic synonym,
#'   otherwise NA.}
#'   \item{parent_plant_name_id}{ID for the parent genus or parent species of an
#'   accepted species or infraspecific name. Empty for non accepted names or
#'   where the parent has not yet been calculated.}
#'   \item{powo_id}{Identifier required to look up the name directly in Plants
#'   of the World Online (POWO).}
#'   \item{hybrid_formula}{Parents of hybrid.}
#'   \item{reviewed}{Flag indicating whether the family to which the taxon
#'   belongs has been peer reviewed.}
#'
#'   ...
#' }
#' @source \url{http://sftp.kew.org/pub/data-repositories/WCVP/wcvp.zip}

"wcvp_names"

#' The World Checklist of Vascular Plants: distributions
#'
#' A dataset containing the distribution data from the WCVP, mapped to the
#' Biodiversity Information Standards (TDWG) World Geographical Scheme for
#' Recording Plant Distributions (WGSRPD)
#'
#' @format A data frame with 1,950,339 rows and 11 variables:
#' \describe{
#'   \item{plant_locality_id){Sequential number.}
#'   \item{plant_name_id}{World Checklist of Vascular Plants (WCVP) identifier}
#'   \item{continent_code_l1}{WGSRPD Level 1 code.}
#'   \item{continent}{WGSRPD Level 1 name.}
#'   \item{region_code_l2}{WGSRPD Level 2 code.}
#'   \item{region}{WGSRPD Level 2 name}
#'   \item{area_code_l3}{WGSRPD Level 3 code}
#'   \item{area}{WGSRPD name}
#'   \item{introduced}{0 if native; 1 if introduced}
#'   \item{extinct}{1 if extinct; 0 if extant}
#'   \item{location_doubtful}{1 if doubtful; 0 otherwise}
#'
#' }
#' @source \url{http://sftp.kew.org/pub/data-repositories/WCVP/wcvp.zip}

"wcvp_distributions"


#' Biodiversity Information Standards (TDWG) World Geographical Scheme for
#' Recording Plant Distributions (WGSRPD)
#'
#' Spatial data for WGSRPD Level 3, for plotting maps
#'
#' @format An 'sf' object with 20 rows and 4 variables:
#' \describe{
#'   \item{LEVEL3_NAM}{Region name}
#'   \item{LEVEL3_COD}{Region code}
#'   \item{LEVEL2_COD}{Level 2 code}
#'   \item{LEVEL1_COD}{Level 1 code (continent)}
#'   \item{geometry}{sf geometry}
#'   \item{fillcol}{Used for mapping.}
#'   }
#'
#' @source  \url{https://github.com/tdwg/wgsrpd/tree/master/level3}

"wgsrpd3"

#' Aggregated WGSRPD3 polygons, for mapping
#'
#' Spatial data from WGSRPD Level 3, for plotting maps
#'
#' @format An 'sf_MULTIPOLYGON' object.
#'
#' @source Aggregated from: \url{https://github.com/tdwg/wgsrpd/tree/master/level3}

"coast"

#' Biodiversity Information Standards (TDWG) World Geographical Scheme for
#' Recording Plant Distributions (WGSRPD), centered on 180 longitude
#'
#' Spatial data for WGSRPD Level 3, for plotting maps
#'
#' @format An 'sf' object with 20 rows and 4 variables:
#' \describe{
#'   \item{LEVEL3_NAM}{Region name}
#'   \item{LEVEL3_COD}{Region code}
#'   \item{LEVEL2_COD}{Level 2 code}
#'   \item{LEVEL1_COD}{Level 1 code (continent)}
#'   \item{geometry}{sf geometry}
#'   \item{fillcol}{Used for mapping.}
#'   }
#'
#' @source  \url{https://github.com/tdwg/wgsrpd/tree/master/level3}

"wgsrpd3_pacific"

#' Aggregated WGSRPD3 polygons centered on 180 longitude, for mapping
#'
#' Spatial data from WGSRPD Level 3, for plotting maps
#'
#' @format An 'sf_MULTIPOLYGON' object.
#'
#' @source Aggregated from: \url{https://github.com/tdwg/wgsrpd/tree/master/level3}

"coast_pacific"
