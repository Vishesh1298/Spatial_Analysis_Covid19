# COVID-19 Geospatial Analysis

## Overview

This repository contains scripts and data for a comprehensive geospatial analysis of COVID-19 data. The analysis covers mapping confirmed cases, exploring mortality rates, and examining the influence of population density and climate on the spread of the virus. The data is visualized using QGIS, with additional database setup provided for PostgreSQL in PgAdmin.

## Files

- **Covid_Database_setup.sql**: SQL script to set up the database in PgAdmin, including necessary tables and views.
  
- **Covid_Analysis.sql**: SQL script for data analysis, including altered date columns and additional views suitable for mapping in QGIS.

- **Population_density.shp**: Shapefile containing population density data for mapping in QGIS.

- **Climate_world.tiff**: TIFF file with climate data for global mapping. Further processing may be required in QGIS to create a heatmap.

## Instructions

1. **Database Setup**: Execute the `Covid_Database_setup.sql` script in PgAdmin to set up the necessary database structure.

2. **Data Analysis**: Run the `Covid_Analysis.sql` script in PgAdmin to perform the geospatial analysis on the COVID-19 data.

3. **QGIS Mapping**:
    - Load the `Population_density.shp` shapefile into QGIS for mapping population density.
    - Process the `Climate_world.tiff` file in QGIS for creating a heatmap of climate data.
