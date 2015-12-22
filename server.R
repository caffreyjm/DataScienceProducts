## server side support for estimate of baseball winning percentages
library(shiny)

## calculate wins
getWins <- function(RS,RA,SL){
	WP <- (RS^1.81)/((RS^1.81)+(RA^1.81))
	wins <- round((WP*SL),0)
}
## calculate wins
getLoss <- function(RS,RA,SL){
	WP <- (RS^1.81)/((RS^1.81)+(RA^1.81))
	wins <- round(((1-WP)*SL),0)
}
shinyServer(
	function(input, output) {
		output$Scored <- renderText({input$runsScored})
		output$Allowed <- renderText({input$runsAllowed})
		output$Season <- renderText({input$seasonLength})
		output$Accuracy <- renderText({input$accuracyEst})
		output$MostLikely <- renderText({
					input$makeEst
					paste('Wins',getWins(input$runsScored,input$runsAllowed,input$seasonLength),
								 'Losses',getLoss(input$runsScored,input$runsAllowed,input$seasonLength)
							)
					})
		output$Best <- renderText({
					input$makeEst
					paste('Wins',
							getWins((input$runsScored+(input$runsScored*input$accuracyEst/100)),
							        (input$runsAllowed-(input$runsAllowed*input$accuracyEst/100)),
									 input$seasonLength),
								 'Losses',
							getLoss((input$runsScored+(input$runsScored*input$accuracyEst/100)),
							        (input$runsAllowed-(input$runsAllowed*input$accuracyEst/100)),
									 input$seasonLength)
							)
					})
		output$Worst <- renderText({
					input$makeEst
					paste('Wins',
							getWins((input$runsScored-(input$runsScored*input$accuracyEst/100)),
							        (input$runsAllowed+(input$runsAllowed*input$accuracyEst/100)),
									 input$seasonLength),
								 'Losses',
							getLoss((input$runsScored-(input$runsScored*input$accuracyEst/100)),
							        (input$runsAllowed+(input$runsAllowed*input$accuracyEst/100)),
									 input$seasonLength)
							)
					})		
	}
)