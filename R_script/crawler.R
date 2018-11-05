install.packages("rvest")
library(rvest)
library(stringr)
link = vector()
web<-'https://academic.oup.com/dnaresearch/issue-archive'
Link<-web%>%read_html()%>%html_nodes(".center-inner-row.no-overflow a")%>%html_text()
dir.create("articles")
for(i in 1:length(Link)){
  new_web = paste0('https://academic.oup.com/dnaresearch/issue-archive','/',Link[i])
  s<-new_web%>%read_html()%>%html_nodes("#item_ResourceLink a")%>%html_text()
  for(j in 1:length(s)){
    number = list()
    number =str_extract_all(s[j],"[0-9]+")
    required_web = paste0('https://academic.oup.com/dnaresearch/issue/',number[[1]][1],'/',number[[1]][2])
    required_link<-required_web%>%read_html()%>%html_nodes(".ww-citation-primary a")%>%html_text()
    for(k in 1:length(required_link)){
      link[k]<-sub("https://doi.org/","",required_link[k])
      link[k]<-gsub("/","_",link[k])
      download.file(required_link[k],paste0("articles/",link[k],".html"))
      
    }
  }
}

