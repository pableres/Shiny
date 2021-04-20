#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(readxl)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("superhero"),

    # Application title
    titlePanel("Sexual Opinion Survey"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        
        sidebarPanel(width = 4,
            
            selectInput("Sexo", "Sexo",
                        choices = c("Hombre", "Mujer")),
            selectInput("Edad", "Rango edad",
                        choices = c("18-35", "36-50", "+50")),
            
            HTML("<h3>introducción datos</h3>"),
            helpText("Recuerde que 1 es completamente en desacuerdo"),
            helpText("Recuerde que 7 es completamente deacuerdo"),
            br(), 
            
            sliderInput(inputId ="SOS1",
                         label = "Bañarme desnudo/a con una persona del sexo que me atrae podría ser una experiencia excitante.",
                         min = 1, max = 7,
                         value = 4, 
                        ticks = FALSE),
                            
            br(),
            sliderInput(inputId = "SOS2",
                         label = "Masturbarme podría ser una experiencia excitante.",
                         min = 1,
                         max = 7,
                         value = 4,
                        ticks = FALSE),
            
            br(),
            sliderInput(inputId = "SOS3",
                        label = " Me resulta excitante pensar en tener una relación sexual.",
                        min = 1,
                        max = 7,
                        value = 4,
                        ticks = FALSE),
            br(),
            sliderInput(inputId = "SOS4",
                        label = " Sería una experiencia excitante acariciar mis genitales.",
                        min = 1,
                        max = 7,
                        value = 4,
                        ticks = FALSE),
            
            br(),
            sliderInput(inputId = "SOS5",
                        label = "Me agrada tener sueños sexuales.",
                        min = 1,
                        max = 7,
                        value = 4,
                        ticks = FALSE),
            
            br(),
            sliderInput(inputId = "SOS6",
                        label = "Siento curiosidad por el material de contenido sexual (libros, películas).",
                        min = 1,
                        max = 7,
                        value = 4,
                        ticks = FALSE),
           
            
            actionButton("submitbutton", "Submit", class = "btn btn-primary")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tags$label(h3('Resultado')), # Status/Output Text Box
            h2(verbatimTextOutput('puntuacion')),
            tableOutput('clasificacion')
            )
    )
)



# Define server logic required to draw a histogram
server <- function(input, output) {
    
    baremos <- read_excel("C:/Users/pable/Desktop/Escritorio antiguo/Investigacion/Shiny/baremos.xlsx", 
                          col_names = FALSE)
    baremos<- as.data.frame(baremos)
    
        output$puntuacion<-renderPrint({sum(input$SOS1, input$SOS2,input$SOS3, input$SOS4,input$SOS5, input$SOS6)
        })
            output$clasificacion<-renderTable(print(baremos))    
            }
        


# Run the application 
shinyApp(ui = ui, server = server)
