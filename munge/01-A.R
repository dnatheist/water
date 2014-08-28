##Make Location a factor Variable
EcoChemAnalysis$Location<-as.factor(EcoChemAnalysis$Location)
#Remove A couple of blank/useless variables
ECA<-within(EcoChemAnalysis, rm("AdultRecordNumber","LarvalRecordNumber"))
#Remove NAs. 
ECA<-na.omit(ECA)

##Create row names for ECA (for clustering)
row.names(ECA)<-ECA$SampleFieldLabel
#Remove junk from Field labels so thet are actual locations
ECA$SampleFieldLabel<-gsub("#.*?","",ECA$SampleFieldLabel)
ECA$Location<-gsub("#","",ECA$Location)
ECA$SampleFieldLabel<-ECA$SampleFieldLabel
ECA$SampleFieldLabel<-gsub("1.*?","",ECA$SampleFieldLabel)
ECA$SampleFieldLabel<-gsub("2.*?","",ECA$SampleFieldLabel)
#Make Factor
ECA$SampleFieldLabel<-as.factor(ECA$SampleFieldLabel)
##Set Locations as a name rather than a number.
ECA$Location<-ECA$SampleFieldLabel
##Fix some location names
ECA$Location<-gsub("umbidgee","",ECA$Location)
ECA$Location<-gsub("Xing ","Xing",ECA$Location)
ECA$Location<-gsub("Lower Molongolo ","Molongolo",ECA$Location)
##describeBy(ECA,ECA$Location)

##Get the locations into a sensible order. Murrumbidgee sites upstram to downstream, then the tributaries from upstream to downstream. This may be better considered as a function of distance from AC.This will require extracting the data afresh. (Al: consider use of database connect and select statement: See http://blog.yhathq.com/posts/10-R-packages-I-wish-I-knew-about-earlier.html item #5 for details)

# Reorder by Locations
##Murrumbidgee on the left, tributaries on the right. Both in downstream descending order.
ECA$Location <- factor(ECA$Location, levels=c( "Angle Xing","Tharwa","Murr@TuggC","Murr@Cotter","Uriarra","Taemas","Gudgenby","Tugg.Crk","Cotter","Molongolo"), ordered=TRUE)