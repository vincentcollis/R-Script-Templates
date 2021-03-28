# How to delete charecters after a certain entry

#example

rs<-c("copyright @ The Society of mo","I want you to meet me @ the coffeshop")
s<-gsub("@.*","",rs) #.* marks the charecter your looking for
s

#I used this

name$last_name <-gsub(",.*","", name$last_name)

# How to delete charecters BEFORE a certain entry

rs<-c("copyright @ The Society of mo","I want you to meet me @ the coffeshop")
s<-gsub(".*@","",rs)
s

#Remove names with A. B. etc

df2$fn <- sub("A[.]|B[.]|C[.]|D[.]|E[.]|H[.]|I[.]|J[.]|K[.]|L[.]|M[.]|N[.]|O[.]|P[.]|Q[.]|R[.]|S[.]|T[.]|U[.]|V[.]|W[.]|X[.]|Y[.]|Z[.]", "", df2$fn)
