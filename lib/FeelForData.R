FeelForData <- function(df) {
  # Computes a standard summaty of data for perusal.
  #
  # Args:
  #   df: The data file to be summarised.
  #
  # Returns:
  #   The data with a variety of summaries.
  df <- ECA
  # Error handling
  str(df)
  corrgram(df)
  #sapply(df[1,],class)
  #unique(df$Location)
  table(df$Location,df$DateCollected)
}
