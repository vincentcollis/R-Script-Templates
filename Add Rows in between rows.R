precint_list <- read.csv(file = "precint_list.csv")
df <- precint_list

#DATA
row.names(df) = NULL

#Number of empty rows to insert
N = 2

#Every N rows after which empty rows should be inserted
after_rows = 6

df2 <- do.call(rbind, lapply(split(df, ceiling(1:NROW(df)/after_rows)),
                      function(a) rbind(a, replace(a[1:N,], TRUE, ""))))

        