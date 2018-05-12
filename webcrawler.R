library(rvest)

content <- read_html('https://news.ycombinator.com/')

title <- content %>%
  html_nodes('a.storylink') %>% html_text()

