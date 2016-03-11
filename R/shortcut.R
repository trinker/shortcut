#' Create Shortcuts
#' 
#' Creates an HTML file that redirects to a specified link.
#' 
#' @param file The name of the output file.  Defaults to attempt to create in 
#' working directory using the \code{\link[base]{basename}} of \code{url}.  
#' Using \code{""} results in printing to the console.
#' @param url A url to redirect to.
#' @param open logical.  If \code{TRUE} \code{shortcut} attempts to open the 
#' file in a default browser.
#' @param check.ext logical.  If \code{TRUE} check for and add an HTML file 
#' extension to file.
#' @export
#' @rdname shortcut
#' @examples
#' shortcut(url = "http://www.talkstats.com/")
#' \dontrun{
#' shortcut(url = "http://trinker.github.io/card/contact", file = "tyler")
#' }
shortcut <- 
function (file = NULL, url = read_clip(), open = TRUE, check.ext = TRUE) {

    message("Attempting to create shortcut\n")
    root <- c("<!DOCTYPE html>", "<html>", "<head>", "<script>", 
        "</script>", "<meta http-equiv=\"refresh\" content=\"0; url=%s\" />", 
        "</head>", "<body>", "    </body>", "</html>")
    out <- sprintf(paste(root, collapse = "\n"), url)

    if (is.null(file)){
        file <- basename(url)
    }

    if (check.ext && tools::file_ext(file) != "html" && file != "") {
        file <- paste0(file, ".html")
    }
    cat(out, file = gsub("[:*?\"<>|]", "", file))
    message("...\n")
    if (open && file.exists(file)) {
        message(sprintf("Attempting to open %s...\n", file))
        browseURL(file)
    }
}


#' @export
#' @rdname shortcut
sc <- shortcut