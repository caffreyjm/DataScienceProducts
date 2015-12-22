## UI definition for estimate of base ball winning percentages

library(shiny)

shinyUI(
	pageWithSidebar(
		# Application title
		headerPanel("North American Major League Baseball Record Prediction"),
		# Sidebar for input
		sidebarPanel(
			h2('Estimated Season Long Results'),
			numericInput('runsScored', label= h3('Runs Scored'), 500, min = 200, max = 2000, step = 5),
			numericInput('runsAllowed', label=h3('Runs Allowed'), 500, min = 200, max = 2000, step = 5),
			numericInput('seasonLength', label=h6('Number of Games in Season'), 162, min = 30, max = 200, step = 1),
			numericInput('accuracyEst', label=h6('How Confident %'), 5, min = 0, max = 20, step = 5),
			submitButton('Update Estimate')
    ),
		# Results
		mainPanel(
			h2('Prediction of Season Long Record'),
			p('Sabermetrics - data science for baseball - has developed an estimate of the winning percentage
			of North American Major League teams based on the runs the team scored and runs 
        allowed during a season. Using the predicted winning percentage and length of season
        the team record is predicted.'),
			p('You can use this app to predict the record of your favorite team based on a portion
      of the schedule already played or
			determine if your team was lucky or unluky (did better or worse than expected).'),
      h4('Input needed'),
      p('The actual runs scored and the runs allowed by the team for the entire
        season or portion of the season or the estimated runs scorred and the runs allowed by the team for the next season 
        based on other Sabermetric estimates.'),
      p('The length of the season.'),
      h4('Input'),
			h6('Runs Scored'),
			verbatimTextOutput("Scored"),
			h6('Runs Allowed'),
			verbatimTextOutput("Allowed"),
			h6('Season Length'),
			verbatimTextOutput("Season"),
			h6('Accuracy of Estimate - =/- n%'),
			verbatimTextOutput("Accuracy"),
			br(),
			h2('Results'),
			h5('Best outcome'),
			verbatimTextOutput("Best"),
			h3('Most likely outcome'),
			verbatimTextOutput("MostLikely"),
			h5('Worst outcome'),
			verbatimTextOutput("Worst")
		)
	)
)