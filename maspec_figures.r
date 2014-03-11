rm(list = ls())

# change this to the folder wich contains mfSBA
#
setwd("~/Dropbox/cpp/SpatialAnalysis/mfsba")

source('Fun_MFA.r')

dq <- calcDq_mfSBA("rnd256.sed","q21.sed 2 512 20 S",F)

dq$Site <- "Random" 

hist(dq$R.Dq)

dq1<- calcDq_mfSBA("b4-991008bio.sed","q21.sed 2 512 20 S",F)

hist(dq1$R.Dq)

dq1$Site <- "Biomass"

dq <- rbind(dq,dq1)


# A publication quality graph requires lattice & Hmisc packages
#
plot_DqCI(dq)

dq1<- calcDq_mfSBA("t64-0100.sed","q21.sed 2 512 20 S",T)

dq1$Site <- "Untransformed"

# multiSpeciesSBA runs with an option to save the SRS file (the last A)
#
dq<- calcDq_multiSBA("t64-0100.sed","q21.sed 2 512 20 A",T)

dq$Site <- "Species Rank Surface"

dq <- rbind(dq,dq1)

# This is the figure 2 in the manuscript
png("Fig1.png", width=6,height=6,units="in",res=600)
plot_DqCI(dq)
dev.off()

# This is the figure 1 in the manuscript
png("Fig2.png", width=6,height=6,units="in",res=600)
plotDqFit("t.t64-0100.sed","q21.sed")
dev.off()


# These are for the appendix figure 1
# Original image
png("Fig3a.png", width=6,height=6,units="in",res=600)
plot_sed_image("t64-0100.sed","")
dev.off()

# Reordered image
png("Fig3b.png", width=6,height=6,units="in",res=600)
plot_sed_image("t64-0100Reord.sed","")
dev.off()






