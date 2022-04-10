# -*- coding: utf-8 -*-
"""
Created on Sat Apr  9 23:35:13 2022

@author: yujia
"""

import pandas as pd
import plotly
import plotly.express as px
import seaborn as sns

volcanoes = pd.read_csv("archive/volcano_data_2010.csv")
earthqua = pd.read_csv("earthquake/database.csv")

## add year_month to volcanoes df
volcanoes["year_month"] = volcanoes["Year"].astype(str) + "-" + volcanoes["Month"].astype(str)
volcanoes["year_month"] = pd.to_datetime(volcanoes["year_month"])
volcanoes["year_month"] = volcanoes["year_month"].apply(lambda x: x.strftime('%Y-%m'))
volcanoes["event"] = "volcano eruption"
vol_loc = volcanoes[['Latitude', 'Longitude','year_month','event']]

earthqua["Date"] = pd.to_datetime(earthqua["Date"])#.dt.strftime('%Y-%m')
earthqua["year_month"] = earthqua["Date"].apply(lambda x: x.strftime('%Y-%m')) 

earthq_loc = earthqua[['Latitude', 'Longitude','year_month']]


# select the earthquake years
vol_year_month = list(volcanoes["year_month"].unique())
earthq_loc = earthq_loc[earthq_loc['year_month'].isin(vol_year_month)]
earthq_loc["event"] = "earthquake"

combined_df = vol_loc.append(earthq_loc)

#### plotting earthquake with volcano eruption
fig = px.scatter_geo(
    combined_df,  # dataframe
    lon = 'Longitude',
    lat = 'Latitude',
    color="event",  # column shown by color
    hover_name="event",  # hover info title
    #size="pop",  # column shown by size
    animation_frame="year_month",  # column animated
    #projection="orthographic",  # type of map
    title="Volcano Eruption and Earthquake from 2010 to 2017"
)
fig.show()
fig.write_html("df4_plot1.html")


# drop feature which is inside missing value
volcanoes.drop(['TSU', 'EQ', 'MISSING', 'MISSING_DESCRIPTION', 'DAMAGE_MILLIONS_DOLLARS', 
                'HOUSES_DESTROYED', 'TOTAL_MISSING', 'TOTAL_MISSING_DESCRIPTION', 
                'TOTAL_DAMAGE_MILLIONS_DOLLARS', 'TOTAL_HOUSES_DESTROYED', 'Agent'], 
               inplace=True, axis=1)

# fill in data with mean in which there is a missing value
volcanoes = volcanoes.fillna(volcanoes.mean())


###### Plot 2 for volcanoes
fig2 = px.box(
    volcanoes,
    x="Country",
    y="TOTAL_DEATHS",
    labels={"TOTAL_DEATHS": "Total deaths",
           "Country": "Country"},
    title = "Total deaths in Each Country",
    color = "Country",
    width=600,
    height=600,
)
fig2.show()
fig2.update_xaxes(categoryorder='total descending')
fig2.write_html("df4_plot2.html")

###### Plot 3 for volcanoes
volcanoes.drop(index = [6], inplace = True)
fig3 = px.box(
    volcanoes,
    x="Country",
    y="TOTAL_DEATHS",
    labels={"TOTAL_DEATHS": "Total deaths",
           "Country": "Country"},
    title = "Total deaths in Each Country",
    color = "Country",
    width=600,
    height=600,
)
fig3.update_xaxes(categoryorder='total descending')
fig3.show()
fig3.write_html("df4_plot3.html")


###### Plot 4 for volcanoes
fig4 = px.scatter(
    data_frame=volcanoes,
    x="Elevation",
    y="TOTAL_DEATHS",
    color="Status",
    template="plotly_white",
    title="Total Death VS Elevation of Volcanoes from 2010 to 2017"
)
fig4.show()
fig4.write_html("df4_plot4.html")







