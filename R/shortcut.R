#' Create Shortcuts
#' 
#' Creates an HTML file that redirects to a specified link.
#' 
#' @param url A url to redirect to.
#' @param file The name of the output file.  Defaults to the console.
#' open A name to use for the file (.html extension).
#' @export
#' @examples
#' shortcut("http://www.talkstats.com/")
#' \dontrun{
#' shortcut("http://trinker.github.io/card/contact")
#' }
shortcut <- function(url=read_clip(), file = "", open = TRUE) { 
	message("Attempting to create shortcut\n")
		
    root <- c("<!DOCTYPE html>", "<html>", "<head>", "<script>", "</script>", 
        "<meta http-equiv=\"refresh\" content=\"0; url=%s\" />", "</head>", 
        "<body>", "    </body>", "</html>")
    
    out <- sprintf(paste(root, collapse="\n"), url)
    
    cat(out, file=file)

	message("...\n")	
	
	if (open && file.exists(file)) {
	    message(sprintf("Attempting to open %s...\n", file))	
		browseURL(file)
	}
}

