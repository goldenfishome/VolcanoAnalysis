# midpoint

This project focused on the volcanoes

## Links of Data Resources
 
[Dataset1](https://www.kaggle.com/code/arditriana/volcano-eruption-data-visualization/data) 
[Dataset2](https://volcano.si.edu/volcanolist_countries.cfm) 
[Dataset3](https://www.kaggle.com/datasets/usgs/earthquake-database?modal=true) 
[Dataset4](https://volcano.si.edu/volcanolist_holocene.cfm) 
[Dataset5](https://www.kaggle.com/datasets/jessemostipak/volcano-eruptions) 

## 

All visualizations in this project here are created from either python Ploty or R Plotly library. All the plots here are interactive and support the function of panning, zooming, box selection, and showing additional information when hovering over the data point. 

![original](/original.png)
![revise](/revise.jpg)
![avatar](https://zehuiwu.georgetown.domains/ANLY503/Mid_point_Project/20881649644116_.pic.jpg)
![avatar](https://zehuiwu.georgetown.domains/ANLY503/Mid_point_Project/20861649643623_.pic_hd.jpg)

Data Science Story and Visualization Description
15th Jan 2022, Georgetown University student Lisa Chen was shocked by the news of a volcanic eruption that happened in Tonga. She was very worried about the situation there since one of her best friends Fangu Fukofuka is from Tonga. Lisa texted Fangu right after she saw the news in the morning. 6 hours passed, and Fangu still did not text back. And the whole world had trouble connecting with Tonga as well. Lisa desperately wanted to know how devastating the effect of the volcanic eruption could be, and how possible it can be related to other natural disasters, including earthquakes, tsunamis, etc.
 
She opened the website “VolcaKnows” and will see a dataset of the worldwide distribution of volcanoes, which have attributes of city, country, volcano type, and time of the eruption, along with a map plot of the dataset. The second part of the website shows the datasets with various properties and economic and human impacts of volcanoes. Lisa could filter the dataset by location, and see how the historical impacts of volcanic eruptions in the area near Tonga. Besides that, there is another dataset containing information about earthquakes that happened worldwide from the year 1965 to 2016, which can be plotted on the same map as the volcanic eruption to see if they are related to each other. As well as how frequently earthquakes happen in the close area of a volcanic eruption in a given time window.

To get an overview of the volcanic eruptions frequencies in a worldwide range, Lisa found data scientists at “VolcaKnows Company” and asked them for help to discover more information about Volcanoes. VolcaKnows data scientists then generated a Leaflet Map to help Lisa better know the countries and subregions with the most frequent eruptions with very accurate Latitude and Longitude. The Map also vividly shows the volcano types, names, their last eruption, and dominant rock types in Lisa’s friend’s country. 

Before analyzing the recent volcano data, Lisa wanted to have a look to the past era. So she asked the data scientists to make a plot to investigate the number of eruptions in different countries and eras. Then she found the first five most active areas are Indonesia, Japan, the United States, Russia and Chile. This is exactly what Lisa expected, since these countries are next to the earthquake zone. Lisa also found that earth had become more and more inactive by analyzing the axis range of the plot. In other words, volcanoes are going to go dormant. After searching on google, Lisa thought it might be because that magma from the Earth's mantle can no longer reach the volcanoes, and then they do not have enough energy to erupt.


Lisa has done research about how long volcanic eruptions last, so she tried to ask a data scientist to do a visualization of the area of activity where volcanic eruptions last between one to two years for her. And she was excited to find that the moderate explosive volcanoes are the most common and volcanoes are rarely non-explosive or large explosive, there are no volcanoes with very large explosiveness. An interesting fact she found is that the duration days of eruptions is evenly distributed over a period of one to two years. While she was browsing the Volcanopedia website, she became interested in a word called “Vei”, which is a relative measure of the explosiveness of volcanic eruptions. The spread of volcanic explosivity index is relatively spread randomly across the world. She found that active volcanoes focus on and swarm around Southeast Asia, East Asia, the east coast of the Americas and the Mediterranean continent. SInce there are three different kinds of eruption categories, Lisa observed that uncertain and confirmed eruptions observed mostly after year 2000 increased high compared to eruption dated, however, discredited eruptions observed mostly after year 1960 increased high. What is known to us is that there exist active volcanoes all over the world, so Lisa was wondering what are the top 40 active eruption volcanoes around the world, she discovered that the Etna volcano in Italy has the most active eruptions with 104 times, mount Fournaise, Piton de la which lies in France has eruptions 70 times, following by volcano Asosan in Japan with 66 times eruptions.



Lisa is interested about finding how the volcano eruptions are related to the earthquake. She saw an interactive plot from the website showing the distribution of volcano eruptions and earthquakes worldwide from 2010 to 2017. According to the plot, the red dots indicate the earthquakes that happen in a given month, and the blue dots represent the volcano eruptions. By moving the bar underplot, she can see distribution of events at different time periods. From this plot, Lisa found that, in a given month, most volcano eruptions are surrounded by earthquakes. What is more, most volcano eruptions happen at places that historically had earthquakes. This indicates that volcanic eruptions and earthquakes are closely related geological movements. Earthquake could be a concern, however, Lisa should also know that the degree and specific timeline of earthquakes are unknown, it could be a mild or not life-threatening earthquake, or earthquake has already happened before the volcano eruption. 

After looking at the earthquake and volcano eruption visualization, Lisa was still worried about her friend, she started looking at the plot of total number of death from volcano eruption in each countries in last 10 years. She got much more comforted when saw the data of the highest country Indonesia with total death of around 20, which is not that crazy high number, though is still sad.

After one day without hearing back from Fangu, Lisa checked the VolcaKnow website again. This time she was looking at the visualization of the relationship between the elevation of erupted volcanoes and the total number of deaths they caused from 2010 to 2017 with different volcanic statuses, which has a slightly positive correlation between the elevation and total death. Knowing this fact, Lisa searched the elevation and types of volcanoes in Tonga, and tried to find how the total death number close to.

Besides analyzing the death related data. Lisa also wanted to find if there’s any connection between those text information. (e.g. “Volcano Country”, “Volcano Type”, “Volcano Status”, and “Volcano Time”) Therefore, the data scientists did ARM and networking analysis and created three network plots made by support rule, confidence rule and lift rule. According to the plot made by the support rule, Lisa thought D1(Volcano Time) might have a network with historical status and Stratovolcano type. According to the plot made by the confidence rule, Stratovolcano is the connected feature, and in such circumstances U and D1 are both important Volcano Time. In the lift rule, it is kind of like the confidence rule. While it gives more connection to Indonesia with historical status.
