#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
suppressWarnings(library(shiny))
suppressWarnings(library(markdown))
suppressWarnings(library(shinyBS))
suppressWarnings(library(shinythemes))
shinyUI(navbarPage("Predict Next Word", theme = shinytheme("superhero"),
                   tabPanel("Word Prediction",
                            sidebarLayout(
                                sidebarPanel(
                                    helpText("The user should enter a sequence of words"),
                                    textInput("inputString", "Write here",value = "")
                                ),
                                mainPanel(
                                    h2("Prediction"),
                                    verbatimTextOutput("prediction"),
                                    strong("User's sequence"),
                                    tags$style(type='text/css', '#answer {background-color:color: white;}'), 
                                    textOutput('answer'),
                                    br(),
                                    strong("Which dataset has been used?"),
                                    tags$style(type='text/css', '#method {background-color:color: white;}'),
                                    textOutput('method')
                                )
                            )
                   ),
                   
                   tabPanel(
                       
                       "Help for Developers",
                       
                       p("A Shiny app has been developed to take as input a phrase (multiple words) in a text box input and to output a prediction of the next word."),
                       
                       tags$div("Please find attached the method to predict the next word:",
                                tags$ul(
                                    tags$li(strong("First,"), "build bigram.RData, trigram.RData and quadgram.RData are obtained"),
                                    tags$li(strong("Then,"), "quadgram.RData is used if the last used 3 words are in the dataset"),
                                    tags$li(strong("Else,"), "trigram.RData is used if the last used 2 words are in the dataset"),
                                    tags$li(strong("Else,"), "bigram.RData is used if the last used word is in the dataset"),
                                    tags$li(strong("Else,"), "the word with the highest frequency is returned"),
                                    tags$li(strong("Finally,", "here is your prediction"))
                                ),
                                
                                tableOutput("dataStructure")
                                
                       )
                       
                   ),
                   
                   
                   
                   tabPanel(
                       
                       "About",
                       
                       h3("Author is in the learner phase where he try new things out to learn machine learning and data science algorithms"),
                       
                       h3("Author: MANAV JAIN "),
                       
                       br(),
                       
                       p("This application is a web application using R and ",
                         a(href = "https://shiny.rstudio.com/", "Shiny library")
                         
                       ),
                       
                       p("Source code is available at-",
                         a(href = "https://github.com/manavjain174/predictnextword",
                           "https://github.com/manavjain174/predictnextword")
                       )
                       
                   )
                   
                   
)
)