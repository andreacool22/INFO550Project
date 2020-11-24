# rule for making report 
report: data/Cool_Project_Data.csv figs/fig1.png R/Cool_Project_Report.Rmd
	Rscript -e "rmarkdown::render('R/Cool_Project_Report.Rmd', output_file = '../output/Cool_Project_Report.html')"

#rule for build docker image
build: Dockerfile
	docker build -t andreacool22/info550 .

# rule for fig 1
figs/fig1.png: R/make_fig1.r data/Cool_Project_Data.csv
	chmod +x R/make_fig1.r && \
	Rscript R/make_fig1.r

# rule for cleaning data
data/Cool_Project_Data.csv: R/Cool_Project_Cleandata.R data/Cool_Project_RawData.csv
	chmod +x R/Cool_Project_Cleandata.R && \
	Rscript R/Cool_Project_Cleandata.R

# rule for installing packages
install: R/packages.r
	chmod +x R/packages.r && \
	Rscript R/packages.r

# echo helpful information
.PHONY: help
help: Makefile
	@echo "report : Generate final analysis report"
	@echo "build: Build docker image"
	@echo "Cool_Project_Data.txt : Clean Cool_Project_Rawdata"
	@echo "fig1.png : Make a bar graph"
	@echo "install : Install necessary R packages"

# clean up directory
clean:
	rm data/Cool_Project_Data.csv figs/fig1.png output/Cool_Project_Report.html
