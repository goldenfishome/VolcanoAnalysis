library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)

erup <- read.csv("archive/eruptions.csv")
head(erup)

eruption <- erup %>%
  mutate(vei_status =  case_when(vei == 0 ~ 'non explosive',
                                 vei == 1 ~ 'small',
                                 vei >= 2 & vei <= 3 ~ 'moderate',
                                 vei >= 4 & vei <= 5 ~ 'large',
                                 vei >= 6 & vei <= 7 ~ 'very large')) %>%
  dplyr::select(c(1,2,5:9,11:16)) %>%
  na.omit() %>%
  distinct()
  
eruption$startdate <- as.Date(with(eruption,paste(start_year,
                                                  start_month,
                                                  start_day,sep="-")),
                              "%Y-%m-%d")

eruption$enddate <- as.Date(with(eruption,paste(end_year,
                                                  end_month,
                                                  end_day,sep="-")),
                              "%Y-%m-%d")
eruption$durations_days = as.numeric(eruption$enddate - eruption$startdate)


##1 area of activity
eruptions <- eruption %>%
  dplyr::select(-c(4:12))

aa <- eruptions %>%
  group_by(area_of_activity, vei_status) %>%
  summarise(durations_days = mean(durations_days)) %>%
  na.omit()

p <- aa %>%
  filter(durations_days > 365 & durations_days < 730) %>%
  ggplot(aes(area_of_activity, durations_days , size = durations_days, 
             color=vei_status)) +
  geom_point() +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("The Area of Activity Where Volcanic Eruptions Last Between 1-2 Years") +
  xlab("Area of Activity") +
  ylab("Duration Days")
  

ggplotly(p)
#library(htmlwidgets)
#saveWidget(p, file="aap.html")

##2 map
library(ggiraph)
library(colormap)
 
ll <- eruption %>%
  ggplot(aes(x = longitude, y = latitude, colour = vei_status, 
             size = vei^5)) +
  geom_point(shape = "circle", alpha = 0.4) +
  theme_bw() +
  scale_fill_gradient() +
  scale_color_hue(direction = 1) + 
  ggtitle("The Spread of Volcanic Explosivity Index") +
  xlab("Longitude") +
  ylab("Latitude")

ggplotly(ll)

##3 evidence_category
ec <- erup %>%
  filter(end_year > 1800) %>%
  ggplot(aes(end_year, fill=eruption_category, alpha = 0.5)) +
  geom_density() +
  #facet_wrap(~vei_status, scales = "free") +
  scale_x_continuous(breaks = seq(1800, 2020, 20)) +
  ggtitle("Comparison Between Volcano Eruption Evidence Categories") +
  xlab("Last Eruption Year") +
  ylab("Density")

ggplotly(ec)

##4 volcanos with more active eruptions
vol <- read.csv("archive/volcano.csv")
ae <- left_join(eruption, vol, by="volcano_name") %>%
  na.omit()
active <- ae %>% 
  group_by(country) %>%
  count(volcano_name) %>%
  arrange(-n) %>%
  head(40) %>%
  ggplot(aes(x=reorder(paste(volcano_name, country, sep = " - "), n), 
             y=n)) +
  geom_bar(stat='identity', fill="lightpink") +
  coord_flip() +
  ggtitle("Volcanos With More Active Eruptions") +
  labs(x="Volcano Names",
       y="Number of Eruptions")

ggplotly(active)

