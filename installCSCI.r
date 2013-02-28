
installif <- function(x){
  for(i in 1:length(x))
    if(!require(package = x[i], character.only=TRUE)){
      install.packages(x[i])
      require(x[i], character.only=TRUE)
    }
}

installif(c("randomForest", "vegan", "stringr",
            "reshape2", "plyr", "data.table"))

installCSCI <- function(){
  tempdir <- tempdir()
  tempfile <- paste0(tempdir, "\\cscibins.zip")
  download.file("https://github.com/mengeln/CSCI_bin/archive/master.zip", tempfile)
  unzip(tempfile, exdir = tempdir)
  packages <- list.files(paste0(tempdir, "\\CSCI_bin-master"), full.names=TRUE)
  packages <- packages[!grepl("installCSCI.r", packages)]
  install.packages(packages, repos=NULL)
  unlink(packages)
}

installCSCI()

rm(installif)
rm(installCSCI)