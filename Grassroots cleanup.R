library(tidyverse)

df <- calltime

# Use unite function from tidyverse
#adds column reason_to_give. This combines all reasons to give
df <- unite(df, 'reason_to_give', c('reason_to_give1','reason_to_give2','reason_to_give3','reason_to_give4'), sep = ', ')

#this code will split bio, ask,and give per cycle from bio
df$donor_bio <- gsub('ask.*','',df$bio)

df$giv_history <- gsub('.*giv_history:','',df$bio)


