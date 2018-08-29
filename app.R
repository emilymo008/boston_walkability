#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

require(shiny)
require(ggmap)

# eventually want to use this font https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300

# Setup:
set.seed(40)
open <- read.csv('openx.csv') # these aren't working for some reason
lib <- read.csv('libx.csv')
map <- get_map(location='roxbury ma', maptype="roadmap",
               zoom=11, scale="auto")
# NEED TO SET UP SAMPLE DF 



#############################################################################################################



ui <- fluidPage(
  # tags$head(includeCSS("www/bootstrap.min.css")), # replace the theme later
  
  
   # Application title
   titlePanel("Boston Community Resources and Walkability"),
   
   # Sidebar 
   sidebarLayout(
      sidebarPanel(
        selectInput("i1", label = h3("Select a community resource..."), 
                    choices = list("Parks, Playgrounds and Athletic Fields" = 1, "Libraries" = 2), selected = 1)),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("o1")
      )
   )
)

# Define server logic
server <- function(input, output) {
  r1 <- reactive({
    if(input$i1 == 1) {ggmap(map, extent = "device") + geom_point(data=sample, aes(x=Lon, y=Lat, color=walk_open), size=3, alpha=1, stroke=0) + 
        scale_color_gradient(low = 'blue', high = 'red') +
        # scale_colour_gradientn(colours = blue2red(3)) +
        scale_x_continuous(limits = c(-71.2, -70.9), expand = c(0, 0)) + 
        scale_y_continuous(limits = c(42.2, 42.45), expand = c(0, 0))}
    else if(input$i1 == 2) {ggmap(map, extent = "device") + geom_point(data=sample, aes(x=Lon, y=Lat, color=walk_lib), size=3, alpha=1, stroke=0) + 
        scale_color_gradient(low = 'blue', high = 'red') +
        # scale_colour_gradientn(colours = blue2red(3)) +
        scale_x_continuous(limits = c(-71.2, -70.9), expand = c(0, 0)) + 
        scale_y_continuous(limits = c(42.2, 42.45), expand = c(0, 0))} 
  })
  
  output$o1 <- renderPlot({r1()})
}


# Run the application 
shinyApp(ui = ui, server = server)

