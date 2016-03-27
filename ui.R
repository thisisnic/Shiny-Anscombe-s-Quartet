library(shiny)

# shinyUI() - Define UI for application that draws a histogram
shinyUI(fluidPage( # fluidPage() - A fluid page layout consists of rows which in turn include columns.
                   #  Fluid pages scale their components in realtime to fill all available browser width.
  
  # Panel containing an application title
  titlePanel("Exploring Anscombe's Quartet"),
  
  # Sidebar with a slider input for the number of bins
  # sidebarLayout() - Create a layout with a sidebar and main area. 
  # The sidebar is displayed with a distinct background color and typically contains input controls. 
  # The main area occupies 2/3 of the horizontal width and typically contains outputs.
  
  sidebarLayout(
    
    # Create a sidebar panel containing input controls that can in turn be passed to sidebarLayout.
    sidebarPanel(
      
      # Constructs a slider widget to select a numeric value from a range.
      radioButtons("radio",
                  "Which dataset would you like to examine?:",
                  choices=list("1" = 1, "2" = 2,
                               "3" = 3, "4" = 4),
                  selected=1
                  
                  
                  
      )
                  
    ),
    
    # Show a plot of the generated distribution
    # mainPanel() - Create a main panel containing output elements that can in turn be passed to sidebarLayout.
    
    mainPanel(
      # plotOutput - Render a renderPlot or renderImage within an application page.
      plotOutput("distPlot")
    )
  )
)
)
