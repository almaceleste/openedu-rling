# Watch global environemnt symbols to provide hover on and completion after session symbol.
# Only specify in .Rprofile since it only takes effect on session startup.
# options(vsc.globalenv = TRUE | FALSE)

# Which view column to show the plot file on graphics update
# Use FALSE to diable plot watcher so that the default R plot device is used.
# Only specify in .Rprofile since it only takes effect on session startup.
# options(vsc.plot = "Two" | "Active" | "Beside" | FALSE)

# The arguments for the png device to replay user graphics to show in VSCode.
# Ignored if options(vsc.plot = FALSE).
# options(vsc.dev.args = NULL | list(width = 800, height = 600))

# Which view column to show the WebView triggered by browser (e.g. shiny apps)?
# Use FALSE to open in external web browser.
# options(vsc.browser = "Active" | "Beside" | "Two" | FALSE)

# Which view column to show the WebView triggered by viewer (e.g. htmlwidgets)?
# Use FALSE to open in external web browser.
# options(vsc.viewer = "Two" | "Active" | "Beside" | FALSE)

# Which view column to show the WebView triggered by page_viewer (e.g. profvis)?
# Use FALSE to open in external web browser.
# options(vsc.page_viewer = "Active" | "Beside" | "Two" | FALSE)

# Which view column to show the WebView triggered by View()?
# Use FALSE for R's native View(), which should be specified in .Rprofile
#   since it only takes effect on session startup.
# options(vsc.view = "Two" | "Active" | "Beside" | FALSE)

# turn on/off support of the Rstudio API
options(vsc.rstudioapi = TRUE)
source(
    file.path(
        Sys.getenv(
            if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"
        ), ".vscode-R", "init.R"
    )
)
