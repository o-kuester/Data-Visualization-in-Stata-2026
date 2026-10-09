*******************************************************
* Title:       Introduction to Data Visualization in Stata
*              Blank Do-File
* Author:      O. Kuester
* Presentation Date: October 21, 2026
*******************************************************

* Import the Iris data from GitHub.
import delimited using "https://raw.githubusercontent.com/o-kuester/Data-Visualization-in-Stata-2026/main/iris.data.csv", clear


*******************************************************
* Quickly Explore the Data
*******************************************************

* Examine variables with the 'summarize' command.


* NOTE: Only summarizes numeric variables. Use 'tab' for categorical variables.


* Browse the entire dataset with 'browse' or 'bro'.


*******************************************************
* Histograms
*******************************************************

* Let's start with the simplest implementation of a histogram.


* Customize bin color and axis range.


* Improve the labels and change the color scheme. Change to frequency instead of density.


* Create separate histograms by iris species.


* Rearrange the histograms and remove the note.


* Use different shades of purple for each iris species.


* Combine histograms with a common title.


*******************************************************
* Pause for an Exercise!
*******************************************************

* Create a histogram using the petal_width variable. Use frequency.
* Change the color to cranberry and set the x-axis from 0 to 3.
* Add a title to the graph.
* Label the x-axis "Petal Width (cm)" and the y-axis "Frequency".



*******************************************************
* Bar Charts
*******************************************************

* Start with a basic bar chart showing the mean sepal length
* for each iris species.


* Other summary statistics you can display include the count, median,
* minimum, maximum, and standard deviation.


* Change the bar color and add a black outline.


* Increase line width.


* Add a title and label the y-axis.


* Customize the size of category labels and add a theme.


* Display the mean value above each bar.



*******************************************************
* Pause for an Exercise!
*******************************************************

* Create a bar chart showing the mean petal_length for each iris species.
* Change the bar color to purple and add black outlines.
* Add a title to the graph. Label the y-axis "Mean Petal Length (cm)".
* Display the mean value above each bar. Set the y-axis scale from 0 to 7.



*******************************************************
* Scatterplots
*******************************************************

* Start with a basic scatterplot showing the relationship
* between sepal length and sepal width.


* Change the marker color and size.


* Add a title and label both axes.


* Change the graph scheme and customize the axis labels.


* Create separate scatterplots for each iris species.



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



*******************************************************
* Saving Graphs as PNG Images
*******************************************************

* Create a graph of your choosing.


* Export the graph as a PNG image to your working directory.


* Export the graph as a PNG image with a custom width.

