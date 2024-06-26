% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basemap.R
\name{basemap}
\alias{basemap}
\alias{basemap_plot}
\alias{basemap_magick}
\alias{basemap_png}
\alias{basemap_geotif}
\alias{basemap_terra}
\alias{basemap_raster}
\alias{basemap_stars}
\alias{basemap_ggplot}
\alias{basemap_gglayer}
\alias{basemap_mapview}
\title{Get a spatial basemap}
\usage{
basemap(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  class = "plot",
  force = FALSE,
  ...,
  verbose = TRUE
)

basemap_plot(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_magick(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_png(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_geotif(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_terra(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_raster(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_stars(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_ggplot(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_gglayer(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)

basemap_mapview(
  ext = NULL,
  map_service = NULL,
  map_type = NULL,
  map_res = NULL,
  map_token = NULL,
  map_dir = NULL,
  force = NULL,
  ...,
  verbose = TRUE
)
}
\arguments{
\item{ext}{extent to be covered by the basemap as any spatial class supported by \code{st_bbox}.}

\item{map_service}{character, a map service, either \code{"osm"}, \code{"carto"} or \code{"mapbox"}. Default is \code{"osm"}.}

\item{map_type}{character, a map type, e.g. \code{"streets"}. For a full list of available map types, see \code{\link{get_maptypes}}.}

\item{map_res}{numeric, resolution of base map in range from 0 to 1.}

\item{map_token}{character, authentication token for services that require registration, which are \code{"osm_stamen"}, \code{"osm_stadia"}, \code{"osm_thunderforest"} and \code{"mapbox"}. Register at \url{https://stadiamaps.com/} (for stamen and stadia), \url{https://www.thunderforest.com/} and/or \url{https://www.mapbox.com/} to get tokens. Ignored for all other map services.}

\item{map_dir}{character, cache directory where downloaded basemap tiles will be stored. By default, a temporary directory is used, which is destroyed when the session is terminated.}

\item{class}{character, output class, either either \code{plot} (default), \code{magick}, \code{png}, \code{geotif} or if suggested packages are installed, \code{terra}, \code{raster}, \code{stars}, \code{ggplot}, \code{gglayer} or \code{mapview}.}

\item{force}{logical, whether to force download over cached files or not. Default is \code{FALSE}.}

\item{...}{additional arguments, including
\itemize{
   \item \code{browse}, logical, for \code{class = "png"} and interactive sessions only. Whether to open the png file in the system's default PNG viewer or not. Default is \code{TRUE}.
   \item \code{col}, character vector of colours for transforming single-layer basemaps into RGB, if \code{class = "png"} or \code{class = "magick"}. Default is \code{topo.colors(25)}.
   \item \code{dpi},  numeric vector of length 1 or 2 specifying the resolution of the image in DPI (dots per inch) for x and y (in that order) - it is recycled to length 2.
   \item etc. (see \code{?gg_raster} for valid arguments when using \code{class = "gglayer"} or \code{class = "ggplot"}, including \code{maxpixels} to control resolution of ggplot outputs
}}

\item{verbose}{logical, if \code{TRUE}, messages and progress information are displayed on the console (default).}
}
\value{
A basemap of the defined class in Web/Pseudo Mercator Projection (EPSG: 3857)
}
\description{
These functions (down)load and cache a basemap of a defined extent \code{ext}, \code{map_service} and \code{map_type} and return it as an object of the defined class. Alternatively to defining the following arguments, \code{\link{set_defaults}} can be used to define basemap preferences once for the running session.
}
\note{
See \link{get_maptypes} for available map services and their sources.

The use of the map services \code{"osm_thunderforest"} and \code{"mapbox"} require registration to obtain an API token/key which can be supplied to \code{map_token}. Register at \url{https://www.thunderforest.com/} and/or \url{https://www.mapbox.com/} to get a token.
}
\examples{
library(basemaps)

# example extent
data(ext)

# view all available maps
get_maptypes()

# set defaults for the basemap
set_defaults(map_service = "osm", map_type = "terrain_bg")
# for "osm_stamen", "osm_stadia", osm "thunderforest" and "mapbox" maps, you need a API token. 
# Register for free at stadiamaps.com, thunderforest.com and mapbox.com to get tokens.

\dontrun{
# load and return basemap map as raster (default)
map <- basemap(ext)

# or explicitely as different classes such as:
basemap_magick(ext)
basemap_raster()
basemap_stars()

# or as files:
basemap_geotif()
basemap_png()

# or as plots:
basemap_plot(ext)
basemap_mapview()

# including ggplot2:
basemap_ggplot(ext)

# or as ggplot2 layer:
library(ggplot2)
ggplot() + 
  basemap_gglayer(ext) +
  scale_fill_identity() + 
  coord_sf()

# or, when combined with an sf vector object,
# make sure to use Web/Pseudo Mercator (EPSG 3857), as this is
# the CRS in which all basemaps are returned (see "Value"):
library(sf)
ext <- st_transform(ext,  crs = st_crs(3857))
ggplot() + 
  basemap_gglayer(ext) + 
  geom_sf(data = ext, color = "red", fill = "transparent") +
  coord_sf() +
  scale_fill_identity()
 }
}
