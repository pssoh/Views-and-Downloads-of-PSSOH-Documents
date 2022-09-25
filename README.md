# Views-and-Downloads-of-PSSOH-Documents
This repository contains relevant information/metadata obtained from the [Zenodo](https://zenodo.org/) communities ([PSSOH](https://zenodo.org/communities/pssoh/), [PSSOH2018](https://zenodo.org/communities/pssoh2018/), [PSSOH2019](https://zenodo.org/communities/pssoh2019/), [PSSOH2020](https://zenodo.org/communities/pssoh2020/), [PSSOH2021](https://zenodo.org/communities/pssoh2021/), and [PSSOH2022](https://zenodo.org/communities/pssoh2022/)) and related to the uploaded PSSOH documents. Shared data and code are result of student internship authored by [Lena Milovanović](https://github.com/lenamilovanovic), master student at the [University of Belgrade - School of Electrical Engineering](https://www.etf.bg.ac.rs/en) in 2021/22 school year under the mentorship of the PSSOH Editor Assoc. Prof. [Nadica Miljković](https://github.com/NadicaSm). The occasion for such analysis was the fifth jubilee of the PSSOH conference ([https://pssoh.etf.bg.ac.rs/](https://pssoh.etf.bg.ac.rs/)).

## Repository Content
The repository consists of the code and data placed in the following documents:
* [viewsAndDownloadsAnalysisPSSOH.R](https://github.com/pssoh/Views-and-Downloads-of-PSSOH-Documents/blob/main/viewsAndDownloadsAnalysisPSSOH.R) - an R code for analysis of views and downloads of openly available PSSOH documents
* [popularityPSSOH.ods](https://github.com/pssoh/Views-and-Downloads-of-PSSOH-Documents/blob/main/popularityPSSOH.ods) - table with summary of views and downloads of openly available PSSOH documents

## Data Structure
The table saved in "popularityPSSOH.ods" has the following structure:
* **abstract**: documents with (1) and without (0) abstract
* **paper**: documents with (1) and without (0) full paper
* **document**: documents with (1) and without (0) document (includes other documents than abstracts, presentations, and full papers, e.g., conference agenda)
* **presentation**: documents with (1) and without (0) presentation
* **title**: the title of a document 
* **serbian**: indicates whether the document is written in Serbian (1) or English (0) 
* **year**: year in which the document was published (possible years are 2018, 2019, 2020, 2021)
* **date of entry1**: date of the first assessment
* **views1**: number of views on the occasion of the first assessment
* **downloads1**: number of downloads on the occasion of the first assessment
* **date of entry2**: date of the second assessment
* **views2**: number of views on the occasion of the second assessment
* **downloads2**: number of downloads on the occasion of the second assessment
* **date of entry3**: date of the third assessment
* **views3**: number of views on the occasion of the third assessment
* **downloads3**: number of downloads on the occasion of the third assessment
* **link**: available Zenodo link 
* **versions**: number of Zenodo versions (possible versions are 1, 2, 3, 4, 5, 8)
* **author1**: full name of the first author
* **author2**: full name of the second author (if none - a cell is empty)
* **author3**: full name of the third author (if none - a cell is empty)
* **author4**: full name of the fourth author (if none - a cell is empty)

## Sample Results
From the available code, one can get an insight into the views and downloads of the PSSOH documents including abstracts, presentations, full papers, agendas, etc. In the Fig. 1 a ranked list of the most viewed files on September 18, 2022 is given.
<p align="center">
![views](https://user-images.githubusercontent.com/41180160/192160068-33148b37-2007-492d-8347-f845bc2336ed.jpeg)
<sub><sup>Figure 1. Ranked views for the PSSOH documents</sup></sub>
</p>
  
In Fig. 2 a ranked list of the most downloaded files on September 18, 2022 is presented. What is rather interesting is the fact that views and downloads do not match. This may be the consequence of the sharing method on other Internet sources.
<p align="center">
![downloads](https://user-images.githubusercontent.com/41180160/192160080-5a21dd06-4475-49ce-8f05-5c68194c6769.jpeg)
<sub><sup>Figure 2. Ranked downloads for the PSSOH documents</sup></sub>
</p>
