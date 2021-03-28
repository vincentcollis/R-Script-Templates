#How to Duplicate Rows

df <- rbinf(df, df[rep(x, y),]) 
# x = the row 
# y = # of times duplicated