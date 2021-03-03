library(tidyverse)
library(magrittr)
library(glue)
library(gganimate)
library(gifski)
en <- earn%>%
  filter (
    sex != "Both Sexes" &
    race != "All Races" &
      (age == "16 to 24 years"| age == "25 to 34 years"|age == "35 to 44 years" |age == "45 to 54 years" |age == "55 to 64 years" |age== "65 years and over")
  )
x <- ggplot(en, aes(x=race, y=median_weekly_earn, fill= sex))+ geom_bar(stat="identity", position ="dodge")+coord_flip()+ labs(y = "Median Weekly Earn" , x = NULL, title = "Median Weekly Earnings in the USA",subtitle = 'By age, race and gender',caption =  "Source: US Bureau of Labor Statistics / Graphic: @fayeee" )
anim <- x + transition_states(year, transition_length = 8, state_length=4)+labs(title = "Year: {closest_state}")+ facet_wrap(~age)
animate(anim, nframe = 200, fps=6, width = 1200, height = 500, renderer = gifski_renderer())
anim_save("median weekly earnings" , animation = last_animation(), path = C:/Users/RYZEN 7/Downloads/Fayeee_e)
