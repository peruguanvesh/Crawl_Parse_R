# Crawler and Parser in R

### Author: Anvesh Kumar Perugu

## Description

* Develop a specialized R program to crawl, parse and extract all articles published in a specific journal.

## Implementation Details

* Programming Language: R
* Version: 3.5

## Packages used

* rvest
* stringr

## Execution Details and Algorithm

How to run:
1. Run the commands in script "Crawler.r" for downloading all articles to .html files.
2. Run the commands in script "Parser.r" for extracting specific information from each article and store data into a .txt file.

## Scripts details:

## Crawler.r:

* In this script, we first install and load the package "rvest" and "stringr"(line 1-3), then initialize a variable "web" to store the site to crawl articles from(line 5).
* In line 6, we initialize a variable "Link" which is a vector to extract the number of years of issue.
* In line 7, we create a directory named "articles" to save downloaded .html files.
* In line 9, we initialize a variable "new_web" to get the url of issue for specific year by combining 'https://academic.oup.com/dnaresearch/issue-archive' and specific year using paste0().
* In line 10, we initialize a variable "s" for obtaining the name of volumes of specific year like "Volume 1, Issue 1,"
* In line 13, we extract the two specific number corresponding to volumes and issues from "s" using str_extract_all() for line 14 to use.
* In line 14, we generate the url that we finally need to crawl from by combining the numbers we got from the last line and 'https://academic.oup.com/dnaresearch/issue/'.
* In line 15, we get all the url corresponding to the articles into a variable "required_link".
* In line 19, we download the articles as .html files to the directory "articles" using download.file().

## Parser.r:

* In this script, we extract infomation from the articles we already downloaded in directory "articles" and store the data in a plain text file.
* In line 4, we initialize a variable "files" to store url of downloaded articles from directory "articles" using list.file()
* In line 7,15,24,32,43-45,52,60,68,75,83, we extract title, DOI, authors, author affliation, corresponding authors, emails, publication date, abstract, key word and full text respectively.
* To deal with problems in string extracted with "\r\n", we use str_replace_all() to remove all of them.
* To make sure those not exist like no email or no corresponding author, we make them all "NA" by using if statements to determine if the string is NULL, like  if(length(full_text)==0){
    full_text<-'NA'}

* (line 86-88)
   To store all the information extracted above, we initialize a variable "information", a list to store all of the information.
* In line 94, we output all information to a .txt file as"DNAResearch.txt" using write.table().

