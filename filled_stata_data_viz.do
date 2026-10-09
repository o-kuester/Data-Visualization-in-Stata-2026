*******************************************************
* Title:       Introduction to Data Visualization in Stata
*              Filled-In Do-File
* Author:      O. Kuester
* Presentation Date: October 21, 2026
*******************************************************

* Import the Iris data from GitHub. 
import delimited using "https://raw.githubusercontent.com/o-kuester/Data-Visualization-in-Stata-2026/main/iris.data.csv", clear

*******************************************************
* Quickly Explore the data 
*******************************************************

*Examine variables with the 'summarize' command. 
summarize 

* NOTE: Only summarizes numeric variables. Use 'tab' for categorical variables. 
tab iris_class

*Browse entire dataset with 'browse' or 'bro'
browse 

*******************************************************
* Histograms 
*******************************************************

* Let's start with the simplest implementation of a histogram. 
histogram sepal_length

* Customize bin color and axis range. 
histogram sepal_length, ///
    fcolor(cyan) lcolor(black) ///
    xscale(range(4 8)) xlabel(4(1)8)

* Improve the labels and change the color scheme. Change to frequency instead of density. 
histogram sepal_length, frequency scheme(s1mono) ///
	title("Distribution of Sepal Length") ///
	xtitle(Sepal Length (cm))
	
* Create separate histograms by iris species.
histogram sepal_length, frequency scheme(s1mono) ///
    by(iris_class) ///
    title("Distribution of Sepal Length") ///
    xtitle("Sepal Length (cm)") 
	
* Rearrange the histograms and remove the note 
histogram sepal_length, frequency scheme(s1mono) ///
    by(iris_class, cols(3) ///
        title("Distribution of Sepal Length") ///
        note("")) ///
    xtitle("Sepal Length (cm)") ///
    ytitle("Frequency")
		
* Use different shades of purple for each iris species.
histogram sepal_length if iris_class == "Iris-setosa", ///
    frequency fcolor(lavender) lcolor(black) scheme(s1mono) ///
    title("Setosa") xtitle("Sepal Length (cm)") ///
    xscale(range(4 8)) xlabel(4(1)8) ///
    name(g1, replace)

histogram sepal_length if iris_class == "Iris-versicolor", ///
    frequency fcolor(ebblue) lcolor(black) scheme(s1mono) ///
    title("Versicolor") xtitle("Sepal Length (cm)") ///
    xscale(range(4 8)) xlabel(4(1)8) ///
    name(g2, replace)

histogram sepal_length if iris_class == "Iris-virginica", ///
    frequency fcolor(purple) lcolor(black) scheme(s1mono) ///
    title("Virginica") xtitle("Sepal Length (cm)") ///
    xscale(range(4 8)) xlabel(4(1)8) ///
    name(g3, replace)

* Combine histograms with a common title.
graph combine g1 g2 g3, cols(3) scheme(s1mono) ///
    title("Distribution of Sepal Length by Iris Species")
	

*******************************************************
* Pause for an Exercise!
*******************************************************

* Create a histogram using the petal_width variable. Use frequeny. 
* Change the color to cranberry and set the x-axis from 0 to 3.
* Add a title to the graph.
* Label the x-axis "Petal Width (cm)" and the y-axis "Frequency".

histogram petal_width, frequency ///
    fcolor(cranberry) lcolor(black) ///
    xscale(range(0 3)) xlabel(0(0.5)3) ///
    title("Distribution of Petal Width") ///
    xtitle("Petal Width (cm)") ///
    ytitle("Frequency")
	

*******************************************************
* Bar Charts
*******************************************************

* Start with a basic bar chart showing the mean sepal length
* for each iris species.
graph bar (mean) sepal_length, over(iris_class)


* Other summary statistics you can display include the count, median,
* minimum, maximum, and standard deviation. 
graph bar (count) sepal_length, over(iris_class)
graph bar (median) sepal_length, over(iris_class)
graph bar (min) sepal_length, over(iris_class)
graph bar (max) sepal_length, over(iris_class)
graph bar (sd) sepal_length, over(iris_class)


* Change the bar color and add a black outline.
graph bar (mean) sepal_length, over(iris_class) ///
    bar(1, color(cranberry) lcolor(black))

* Increase line width	
graph bar (mean) sepal_length, over(iris_class) ///
    bar(1, color(cranberry) lcolor(black) lwidth (.4))

* Add a title and label the y-axis.
graph bar (mean) sepal_length, over(iris_class) ///
    bar(1, color(cranberry) lcolor(black) lwidth(.4)) ///
    title("Mean Sepal Length by Iris Species") ///
    ytitle("Mean Sepal Length (cm)")

* Customize size of category labels and add a theme.
graph bar (mean) sepal_length, over(iris_class, ///
    label(labsize(small))) ///
    scheme(s1mono) ///
    title("Mean Sepal Length by Iris Species") ///
    ytitle("Mean Sepal Length (cm)") ///
	ylabel(0(1)8) ///
	yscale(range(0 8)) 

* Display the mean value above each bar.
graph bar (mean) sepal_length, over(iris_class, ///
    label(labsize(small))) ///
    blabel(bar, format(%4.2f) position(outside)) ///
    scheme(stsj) ///
    title("Mean Sepal Length by Iris Species") ///
    ytitle("Mean Sepal Length (cm)") ///
    ylabel(0(1)8) ///
    yscale(range(0 8))


*******************************************************
* Pause for an Exercise!
*******************************************************

* Create a bar chart showing the mean petal_length for each iris species.
* Change the bar color to purple and add black outlines.
* Add a title to the graph.  Label the y-axis "Mean Petal Length (cm)".
* Display the mean value above each bar. Set the y-axis scale from 0 to 7.

graph bar (mean) petal_length, over(iris_class, ///
    label(labsize(small))) ///
    bar(1, color(purple) lcolor(black)) ///
    blabel(bar, format(%4.2f) position(outside)) ///
    scheme(s1mono) ///
    title("Mean Petal Length by Iris Species") ///
    ytitle("Mean Petal Length (cm)") ///
    ylabel(0(1)7) ///
    yscale(range(0 7))
	
	

*******************************************************
* Scatterplots
*******************************************************

* Start with a basic scatterplot showing the relationship
* between sepal length and sepal width.
twoway scatter sepal_width sepal_length

* Change the marker color and size.
twoway scatter sepal_width sepal_length, ///
    mcolor(purple) msize(small)

* Add a title and label both axes.
twoway scatter sepal_width sepal_length, ///
    mcolor(purple) msize(small) ///
    title("Sepal Width by Sepal Length") ///
    xtitle("Sepal Length (cm)") ///
    ytitle("Sepal Width (cm)")

* Change the graph scheme and customize the axis labels.
twoway scatter sepal_width sepal_length, ///
    scheme(s1color) ///
    mcolor(purple) msize(small) ///
    title("Sepal Width by Sepal Length") ///
    xtitle("Sepal Length (cm)") ///
    ytitle("Sepal Width (cm)") ///
    xlabel(4(1)8) ///
    ylabel(2(0.5)5, angle(0) grid) ///
	yscale(range(2 5))

* Create separate scatterplots for each iris species.
twoway scatter sepal_width sepal_length, ///
    scheme(s1color) ///
    msize(small) ///
    by(iris_class, cols(3) ///
        title("Sepal Width by Sepal Length and Species") ///
        note("")) ///
    xtitle("Sepal Length (cm)") ///
    ytitle("Sepal Width (cm)") ///
    xlabel(4(1)8) ///
    ylabel(2(0.5)5, angle(0) grid) ///
	yscale(range(2 5))


*******************************************************
* Pause for an Exercise!
*******************************************************
* Create a scatterplot showing the relationship between
* petal_length and petal_width.
* Change the marker color to cranberry and the marker size to medium.
* Add a title to the graph.
* Label the x-axis "Petal Length (cm)".
* Label the y-axis "Petal Width (cm)".
* Use the s1color scheme and add grid lines. 

twoway scatter petal_width petal_length, ///
    mcolor(cranberry) msize(medium) ///
    title("Petal Width by Petal Length") ///
    xtitle("Petal Length (cm)") ///
    ytitle("Petal Width (cm)") ///
	ylabel( , grid) ///
    scheme(s1color)

*******************************************************
* Saving Graphs as PNG Images
*******************************************************

* Create the graph.
twoway scatter petal_width petal_length, ///
    mcolor(cranberry) msize(small) ///
    title("Petal Width by Petal Length") ///
    xtitle("Petal Length (cm)") ///
    ytitle("Petal Width (cm)") ///
    ylabel(, grid) ///
    scheme(s1color)

* Export the graph as a PNG image to your working directory.
graph export "petal_scatterplot.png", as(png) replace


* Export the graph as a PNG image with a custom width.
graph export "petal_scatterplot.png", as(png) width(2000) replace


