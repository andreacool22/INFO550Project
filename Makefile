# rule for making report 
report: Cool_Project_Data.csv fig1.png Cool_Project_Report.Rmd
	Rscript -e "rmarkdown::render('Cool_Project_Report.Rmd')"

# rule for fig 1
fig1.png: make_fig1.R Cool_Project_Data.csv
	chmod +x make_fig1.R && \
	Rscript make_fig1.R

# rule for cleaning data
Cool_Project_Data.csv: Cool_Project_Cleandata.R Cool_Project_RawData.csv
	chmod +x Cool_Project_Cleandata.R && \
	Rscript Cool_Project_Cleandata.R

# rule for installing packages
install: packages.r
	chmod +x packages.R && \
	Rscript packages.R

# echo helpful information
.PHONY: help
help: Makefile
	@echo "report : Generate final analysis report"
	@echo "Cool_Project_Data.txt : Clean Cool_Project_Rawdata"
	@echo "fig1.png : Make a bar graph"
	@echo "install : Install necessary R packages"

# clean up directory
clean:
	rm Cool_Project_Data.csv fig1.png Cool_Project_Report.html