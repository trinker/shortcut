#' Create Shortcuts
#' 
#' Creates an HTML file that redirects to a specified link.
#' 
#' @param url A url to redirect to.
#' @param file The name of the output file.  Defaults to the console.
#' open A name to use for the file (.html extension).
#' @param check.ext logical.  If \code{TRUE} check for and add an HTML file 
#' extension to file.
#' @export
#' @examples
#' shortcut("http://www.talkstats.com/")
#' \dontrun{
#' shortcut("http://trinker.github.io/card/contact")
#' }
shortcut <- function(url=read_clip(), file = "", open = TRUE, check.ext = TRUE) { 
	message("Attempting to create shortcut\n")
		
    root <- c("<!DOCTYPE html>", "<html>", "<head>", "<script>", "</script>", 
        "<meta http-equiv=\"refresh\" content=\"0; url=%s\" />", "</head>", 
        "<body>", "    </body>", "</html>")
    
    out <- sprintf(paste(root, collapse="\n"), url)
    
    if (check.ext && tools::file_ext(file) != "html") {
        file <- paste0(file, ".html")
    }
    
    cat(out, file=file)

	message("...\n")	
	
	if (open && file.exists(file)) {
	    message(sprintf("Attempting to open %s...\n", file))	
		browseURL(file)
	}
}
