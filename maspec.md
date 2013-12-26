# mfSBA: Multifractal analysis of spatial patterns in ecological communities


**Leonardo A. Saravia**, Ph.D.

Instituto de Ciencias Básicas

Universidad Nacional de General Sarmiento

J.M. Gutierrez 1159 (1613), Los Polvorines

Buenos Aires, Argentina.

<lsaravia@ungs.edu.ar>

\newpage

## Abstract

Multifractals has been applied to characterize complex communities in a spatial context.They were developed for nonlinear systems and are particularly adequate to capture multiplicative processes observed in ecological systems. Multifractals characterize variability in a scale independent way within an experimental range. I have developed an open-source software to estimate multifractals using a box-counting algorithm (available from <https://github.com/lsaravia/mfsba>). The software is specially adequate to use with two dimensional (2D) images as the ones obtained from remote sensing, but other 2D data types can also be analyzed. Additionally I developed a new metric to analyze multispecies spatial patterns with multifractals: spatial rank surface, that is included in the software. 

\newpage
	
## Introduction

Multifractals and fractals are related techniques mainly used in physics to characterize scaling behavior of a system, the difference is that fractals look at the geometry of presence/absence patterns, while multifractals look at the arrangement of quantities like population densities or biomass [@Saravia2012a]. Scaling laws are an emergent general feature of ecological systems, and there is no a priori reason that power laws apply to ecological communities. If they do apply, they reflect constraints in their organization that can provide clues about the underlying mechanisms [@Brown2002; @Sole2006].

Multifractals require that the object under study should be statistically self-similar, that means that a power-law could be fitted to data in a range of scales. But that does not mean that the power-law must be the best possible model. We can use as a technique to analyze the data without claiming that it is an exact multifractal. One of the advantages of multifractals is that they require fewer conditions on data than more classical statistics like autocorrelation and variograms. These usually require isotropy and stationarity [@Fortin2006] but multifractals can be used with anisotropic data [@Harte2001] and are inherently non-stationary [@Laurie2010; @Bez2010]. Anisotropy and nonstationarity are often seen in spatial ecological distributions [@Plotkin2002].

Multifractals are associated with systems governed by random multiplicative processes [@Stanley1988]. In ecological systems and these processes can be given as the interaction of survival probabilities and compound growth [@McGill2003a]. Moreover, the presence of multiplicative process is argued to produce the lognormal-like shape of species-abundance distributions [@May2007a]. Also random processes with spatial correlations can generate multifractals [@Stanley1988], these kind of processes are part of neutral community models [@Houchmandzadeh2003;Yakimov2013] and are observed in natural communities [@Condit2000]. Thus there are a priori reasons to think that multifractals can be applied to much of the spatial ecological data. Indeed it has been applied to vegetal communities [@Scheuring1994], tropical forest [@Sole1995b, @Manrubia1996], microphytobentos and periphyton biomass patterns [@Seuront2002; @Saravia2012a], and to the characterization of species-area relationships [@Borda-de-Agua2002; @Yakimov2008; @Laurie2011]. 

Rank-abundance distributions are a representation of species-abundance distributions (SAD) that are a classical description of a communities [@Mcgill2007]. These have been used to compare different communities and to compare models and data, but different mechanisms can produce nearly identical SADs [@Chave2002]. SADs are often presented using rank-abundance diagrams (RAD) where the log-abundance is plotted on the y-axis vs rank  on the x-axis [@Mcgill2007]. RADs are equivalent to cumulative  distributions [@Newman2005] and thus are a robust way to visualize the SAD without losing information[@Li2005]. If the rank of each species is incorporated in its spatial distribution it forms a surface: the species-rank surface (SRS). This SRS can be analyzed and compared using multifractals.

But the application of multifractals is not widespread [@Seuront2009], one of the reasons is that is difficult to use the available software for quantitative multifractal analysis. Here I present an open source software for that purpose, that can be integrated with the R statistical software.

## Multifractal analysis

Several good introductions to multifractal methods applied to ecology are available [@Scheuring1994; @Borda-de-Agua2007] thus I will only give a brief overview. Multifractals analyze the scaling properties of quantities distributed in a space that we assume to be two dimensional (a plane), but multifractal analysis (MFA) can be used with one dimensional (time series) or three dimensional data [@Lopes2009]. A classical way to characterize multifractals is using the generalized dimensions $D_q$ [@Grassberger1983], also called Renyi dimensions [@Renyi1970]. $D_q$ has been used to characterize the probabilistic structure of attractors derived from dynamical systems [@Harte2001]. 

Another way to characterize multifractals is using the so called spectrum of singularities. This spectrum describe multifractals as interwoven sets each one with a singularity exponent $\alpha$ and a fractal dimension $f(\alpha)$ [Chhabra1989]. The two multifractal representations are equivalent, they display the same information in a different format. But with the spectrum of singularities two quantities are estimated ($\alpha$ & $f(\alpha)$) from data and are obtained with error. Instead, with generalized dimension only one quantity is estimated $D_q$. Thus the last method is preferred for statistical comparisons.



## Estimation

To estimate multifractal spectra I used the method of moments based on box-counting (Halsey et al. 1986). I estimate $D_q$ and at the same time $\alpha$ and $f(\alpha)$ using the canonical method [Chhabra1989]. Here I describe only the $D_q$ estimation, the steps for $\alpha$ and $f(\alpha)$ estimation are identical only the formula to calculate the quantities are different [Saravia2012a].  The spatial distribution that we are analyzing is covered with a grid, which divided it into $N(\epsilon)$ squares of side  $\epsilon$. The contents of each square is called $\mu_i(\epsilon)$. Then the so called partition function is computed as: 

 (@e1) $Z_{q}(\epsilon)={\displaystyle \sum_{i}^{N(\epsilon)}} \left(\mu_{i}(\epsilon)\right)^{q}$

Where $q$ is called moment order. The operation is performed for different values of $\epsilon$ and $q$, within a predetermined range. The generalized dimension is calculated as:

 (@e2) $D_{q}=\cfrac{1}{q-1}\underset{\epsilon\to0}{\lim}\cfrac{\log\left(Z_{q}(\epsilon)\right)}{\log\epsilon}$

When $q = 1$, the denominator of the first term in $D_q$ is undefined, so it must be replaced by the following expression:

 (@e3) $D_{q}=\underset{\epsilon\to0}{\lim}\cfrac{{\displaystyle \sum_{i}^{N(\epsilon)}}\mu_{i}(\epsilon)\log\left(\mu_{i}(\epsilon)\right)}{\log\epsilon}$

In practical cases as the limit can not be assessed, the dimensions are estimated as the slope of the $log(Z_q)$ versus $log(\epsilon)$ in equation (@e1) replacing by the numerator in equation (@e3). This is done for different $q$, provided that it is a real number which yields a graphs of $D_q$ in terms of $q$, called the spectrum of generalized dimensions. 

To be an approximate multifractal the relationship $log(Z_q)$ versus $log(\epsilon)$ should be well described by a linear relationship, but also a linear relationship with superimposed oscillations is accepted [@Borda-de-Agua2007]. A range of $q$ and $\epsilon$ is fixed then $D_q$ is estimated using linear regressions.  The coefficient of determination ($R^2$) can be used as a descriptive measure of goodness of fit [@Borda-de-Agua2002]. 

## Species rank surface

Here I propose to extend the analysis of species abundance distribution (SAD) attaching the rank of each species to its spatial distribution, in this way the multivariate spatial distribution of species is summarized into an univariate 2D distribution. I called this spatial distribution the species-rank surface (SRS), that can be analyzed and compared using multifractals. To construct the SRS the spatial distribution of species has to be transformed assigning to each species position its rank. 
First I calculate the rank ordering the species by their abundances from biggest to lowest and assigning a number starting with one. Then the rank is assigned to the spatial position of the individuals of each species forming a surface. This landscape have valleys formed by the most abundant species and peaks determined by the most rare species. Then the standard multifractal analysis can be applied. 

The source code in C++ to perform the analysis is available at <https://github.com/lsaravia/mfsba>. 

## P-model

This model was originally proposed as a toy model for multifractals [@Stanley1988; @Martinez1990] and is ideal to demonstrate the sensitivity of the $D_q$ spectrum to the scaling and geometry of 2D spatial distributions. Additionally this model with some minor modifications has been used to describe the scaling of the variation in species-richness [@Laurie2011].
The construction process starts with an square area A0 with a uniform distribution of the quantity of interest that can be thought of as individuals of different species or biomass and is subdivided in four smaller squares A1. Each square is assigned at random to a probability $p_i$ with i=1,2,3,4. These are the proportions of the original quantity assigned to the A1 squares. Then each of the A1 squares are subdivided in four and a probability $p_i$ is again assigned. The process is repeated L times. The value attached to a square is the product of the $p_i$ of the square, its parents and all its other ancestors.
It can be shown that for large L the values of the multifractal spectrum are:

 (@e4) $D_{q}=\left(1-q\right)^{-1}{\log}_{2}\left(p_{1}^{q}+p_{2}^{q}+p_{3}^{q}+p_{4}^{q}\right)$
 
where the assignment of the probabilities at each step is done without reposition. The p-model can be  simulated assigning probabilities with reposition, that makes the resulting $D_q$ slightly different from the theoretical. But the generated images are more similar to natural images thus I choose to simulate with reposition. I simulate three examples, with $p_2= p_3=p_4=(1-p_1)/3$ and  $p_1$=0.3, 0.5 and 0.7. I assume the original quantity was a uniform distribution of individuals, so I multiply the final probability distribution by the total number of cells (assuming one individual by cell) and then obtain an value for the number of individuals in that cell. The model was simulated ten times for each $p_1$ and a bootstrap procedure was used to calculate confidence intervals for each $D_q$ (R package boot). The C++ source code for p-model is available at <https://github.com/lsaravia/p-model>.

To demonstrate multifractal analysis I compare slightly different spatial distributions I simulated the model using $p_1$= 0.51 and compare it with $p_1$=0.5 using the bootstrapped CI and a permutation test which gives a global p-level (Function compareGrowthCurves from R package statmod [@Smyth2011]). This test calculates the average T statistic over all points of the curve, then the distribution of this mean T is obtained via permutations. If more than two groups exist the R function calculates all pairwise, correcting p-values for multiple comparisons [@Holm1979]. I repeat the same procedure for $p_1$= 0.3 and 0.7.

The methods used so far to compare two different 2D distributions using multifractals need several realizations of each spatial distribution.  Using experimental study systems or microcosms you can obtain that [@Saravia2012a], but the datasets from natural systems often does not have different realizations or repetitions. One possible approach is to use the standard deviation (SD) from the regression performed to estimate $D_q$. These are obtained with autocorrelated data because small squares are nested within big squares  (See Methods). The consequence is that the SD may be seriously underestimated, but the slopes estimates are still unbiased [@Kutner2005]. Thus I compare the SD obtained by bootstrapping with several repetitions or simulations ($SD_s$) and the one obtained from the regression ($SD_r$) to test the possible use of the latter ones as a rough guide when there is no repetitions. All the analysis were performed using R statistical software and the scripts are available at doi:XXXX-XXXX

## Ecological communities

I demonstrate the use of multifractal analysis using the data from a detailed 50 hectare tropical forest tree censuses in Barro Colorado Island (BCI), realized by the Smithsonian Tropical Research Institute, Center for Tropical Forest Science (CTFS) [@Condit1998].
In this plot all individuals $\geq$ 1cm dbh of free standing woody tree species have been measured and identified. There are seven publicly available censuses from 1982 to 2010.  

The spatial pattern of BCI data has been analyzed several times but all these analysis involve only single or pairs of species distributions [@Seri2012; @Seidler2006; @Condit2000; @Plotkin2002]. Instead, using SRS we can analyze the spatial distribution of all species at the same time, which is an interesting option if we want to study the dynamics of the whole system. 

I use the species-rank surface to compare the seven censuses, one possible question to ask is if the forest is in a transient or equilibrium state. Transient dynamics [@Hastings2004] are expected if non-equilibrium mechanisms are at work, in the case of tropical forest a transient state could be expected because the time to reach an equilibrium state in multispecies systems could be very long [@Tilman1994a] and the same is true for spatially extended ecosystems [@Durrett1994a]. The existence of a non-equilibrium transient state in tropical forest could be due to the existence of multiple basins of attractions and some evidence in this direction was found [@Vandermeer2004]. Since the $D_q$ spectrum has been used to describe the probabilistic structure of attractors [@Harte2001], I hypothesize that if I find  that the $D_q$ spectrum is changing the system is in a transient state and non-equilibrium mechanisms should be determinant for the dynamics of the system. I split the censuses in two at the year 1995 and compare $D_q$ from the two halves using the permutation test.

I use the complete $D_q$ to characterize spatial patterns and also two derived indexes: the information dimension $D_1$ and $\Delta D_i$. The information dimension has been used as an spikiness indicator [@Chappell2001], when it approaches two the image is more uniform, when is lower the image has more spikes and variability. The second index is calculated with: $\Delta D_i = D_{-i}-D_i$ for a relatively large $i$. As I estimate $D_q$ spectrum using a range of q from -5 to 5, I use $\Delta D_5$. When this index is large the range of $D_q$ is greater so the fractal sets that compose the multifractal image will be more heterogeneous and the image as a whole will have more richness in shapes and more spatial variability.

# Results

## p-model

First I analyze p-model, a multifractal toy model [@Stanley1988] that has also been used to model spatial patterns in species richness [@Laurie2011].  
The Figure 1 shows the images generated by the model with different values for the parameter $p_1$. The lowest $p_1$=0.3 (Figure 1a) produces a relatively uniform image with a range from 0 to 4 individuals by cell and a flat spectrum compared with the other two (Figs. 1b,c). The similarity between $p_1$ and the other probabilities used in the model ($p_2...p_4$=0.23) produce this effect. The image with the highest $p_1$=0.7 (Figure 1c) has a range between 0 and 1600, with high values in isolated spots thus it has much more spatial variability than the first. The difference between $p_1$ and the other probabilities is higher ($p_2...p_4$=0.10) and their $D_q$ spectrum have the largest range (Figure 1d).  

The two indexes derived from the multifractal spectrum capture the change in $D_q$. Information dimension $D_1$ diminish and $\Delta D_i$ increases when $p_1$ raises (Table 1). 
I also show in Table 1 the SD calculated using bootstrap and the SD calculated from the regressions used to estimate $D_q$. The last ones are estimated from the spatial distribution, and the previous needs a number of repetitions of the process. As expected the SD from regressions is very small compared with the bootstrapped SD. 

These indexes capture the gross behavior of the $D_q$ but the shape of the spectrum can give us much more information. In the case of the spectra generated by p-model the left and the right part of the spectrum are more like inverted specular images (Figure 1c) but this is not always the case. Different shapes of the $D_q$ can give us clues about different processes that should be acting. 


I compared two similar p-models with parameter $p_1$=0.5 and 0.51 (Figure 2). The images and the $D_q$ spectra were very similar, the bootstrapped CI overlaps mainly in the region with higher $q$ absolute value. But the overlaps are very small suggesting significant differences at 0.05 level [@Cumming2009]. To confirm these results I use the mentioned permutation test [@Smyth2011]. This test calculates the average T statistic over all points of the curve, then the distribution of this mean T is obtained via permutations. Because the differences in the whole $D_q$ spectra change sign from $q$ negative to positive the differences in the T statistic cancel out, thus I tested separately the negative and positive parts of $D_q$ (Table 2). The results coincide with the visual inspection of the bootstrapped CI, for both $q$ positive and $q$ negative the $D_q$ are different. I also compared the $p_1$=0.5 images with another set generated with the same $p_1$ and repeated the procedure for $p_1$=0.3 and 0.7 (Table 2). For $p_1$=0.5 the results confirm the visual inspection of the CI there are differences at both sides of the $D_q$ spectrum and there is no significant differences when the comparison is for realizations of the model with the same $p_1$. With $p_1$=0.3 the results are similar but for $p_1$=0.7 the $D_q$ positive shows no differences for distinct $p_1$. This could be explained because at this level of $p_1$ there is a greater spatial variability and also to a bigger variability between realizations of p-model. The regions of high values are dominated by extreme events that are reflected in the positive $D_q$ which make more difficult the detection of differences. The regions with lower values are described by negative $D_q$ and they do not have such extreme events thus are highly significant.  


## Ecological communities

### Description of $D_q$ spectra

The BCI multifractal spectra ($D_q$) calculated from spatial rank surface (SRS) seem similar for different years (Figure 3). As there is a single image for each time the CI showed was calculated using the SD from the spatial distribution and we had previously seen that this was an underestimate of the true SD, thus as the CI completely overlap I suspect that there are no significant differences. The permutation test gives a p=0.06 for all $q>0$ and $q<0$, as the division of the data at 1995 was arbitrary I repeat the procedure using 1990 as a breakpoint and the results were the same.

The fit of all $D_q$ were very good because all $R^2$ were greater than 0.972. The $R^2$ obtained from p-model are greater than 0.978 so the BCI SRS is very close to a true multifractal (Figure S1). 

The $D_q$ calculated from spatial biomass distribution also does not show differences in time. The range of $R^2$ starts at 0.76 so the fit is not so good (Figure S2). Anyway deviations are expected even in true multifractals if the chosen box sizes $\epsilon$ does not match the multiplicative process [@Chhabra1989]. Here I don't try to demonstrate that the underlying process is multifractal but if the fits were poor the multifractal analysis (MFA) will not be valid. Here more than 50% of $R^2$ are greater than 0.95 thus they are enough to consider MFA valid.

I present the results of MFA for three aquaria (named D E & I) with early and late periphyton development. For periphyton communities with 3 days of development we observe that $D_q$ for $q<0$ are nearly flat and for $q>0$ the curves extends to lower values, this means that these images are composed with a uniform surface of relatively low values (the negative part) and some isolated spots of relatively high biomass (Figure 4b & d). For late periphyton communities (80 days of development) the pattern is inverted $D_q$ is flatter at $q>0$, that means a spatial distribution more uniform at higher biomass. For $q<0$ the curve $D_q$ raises and the patches of relatively low biomass became important. There are differences between two eighty days images, $D_q$ for E and I aquaria are higher than D aquaria, this means that the low biomass spots are more profound in extension and intensity for E and I (Figure 4 b & c).
From previous studies I already know that $D_q$ from periphyton have a very good fit, the same happens here for this new dataset with $R^2$ greater than 0.98 (Figure S2). 


# Discussion

Multifractal spectrum $D_q$ can be used to describe spatial patterns in all the cases I analyzed. Multifractals patterns could be produced by the existence of multiplicative interaction between species but this is not the only possibility, spatially correlated random processes like dispersal and growth to adjacent areas would also produce multifractals [@Stanley1988]. Because plant and animal species are generally aggregated in space is very likely that multifractal analysis can be used in a wide range of cases.
The occurrence of multifractal patterns with the same $D_q$ in several places does not prove that the same mechanism is acting, but may provide stronger evidence for similar mechanisms than if only one fractal dimension is estimated. Usually this dimension corresponds to $D_0$, that characterizes the geometric complexity of the spatial distribution, the other dimensions in the multifractal spectrum characterize the non-uniformity of the distribution [@Harte2001]. This adds much information to the characterization of spatial patterns that is lost if only one dimension is calculated.

I calculated $D_q$ for BCI using the spatial rank surface (SRS) and biomass, besides there seems to be no differences between censuses. Then, what is the interpretation of the spectra? $D_q$ from SRS is more asymmetric, the negative part ($q<0$) is more important, this means that the fluctuations of low values are more important, and low values represent more abundant species. This is directly related to the shape of the non spatial rank-abundance curve, if the community were more even $D_q$ will be more symmetrical. But the interrelation of the species' spatial distributions also influences $D_q$, the patchiness of the less abundant species with respect to the most abundant will change the curvature and the range of $D_q$ in the negative part. The positive part ($q>0$) reflects the rare species and also is influenced by the patchiness. The relationship of $D_q$ with patchiness is revealed with the different dispersal kernels used with the neutral model. The exponential kernel produced well defined patches and $D_q$ is more flat, the inverse power kernel produced more intermingled distributions and $D_q$ have a greater range. Multifractal spectra calculated from biomass is more symmetrical and that is related to the frecuency distribution of high and low biomass values and its spatial distribution.

The analysis of SRS using $D_q$ adds a new dimension to the comparison of species composition, because at the same time is taking into account the spatial distribution and species-abundances. Comparisons could be done for different sample sizes, taking into account that they have a relatively good fit and that the process that act are comparable. For time series of biomass or densities $D_q$ could be also applied. For multispecies time series the Borda-de-Agua [-@Borda-de-Agua2002] should be used.

I relate the variability of the spatial distribution of biomass with richness (S) and Shannon diversity (H) and it is evident that this is a factor that sets an upper limit but there are other important factors involved. Previous studies found a negative relationship between $D_1$ and H [@Alados2007, @Saravia2012], but here I found evidence of a positive relationship. That means that H can increase when the spatial distribution of species is more homogeneous. In contrast S can increase with spatial variability. This can be explained as follows: as H responds more to the variation of abundant species than S, the dominance of a few species produces spatial homogeneity and spatial variability permits the appearance of more species. But also there are other possible explanations, an analysis of $D_q$ in relation with the full species abundance distribution (not only H and S) should be worthwhile and functional diversity should also be considered [@Weigelt2008].

I analyze the existence of a transient or an equilibrium state in BCI plot. I found that $D_q$ characterizing species composition have no differences across years, the same happens with a neutral model representative of BCI, so the results suggest that it should be in a steady state. Besides, Vandermeer [@Vandermeer2004] found the contrary in a related tropical forest using distances between species composition. Both approaches were based in dynamical systems theory, but as they did not test the patterns against a null model, the differences that they found could be due to stochastic dispersal and colonization events or ecological drift. For example, if the tropical forest they analyzed were similar to BCI, the time interval they have since the community was initiated (12 years) was not enough to dissipate the initial transient state and that could explain their results.

To further analyze the existence of a transient or an equilibrium state we should relate the temporal scales relevant to the individuals (generation time) with respect to the temporal scales of change of the whole system [@Durrett2000;@Pascual2001], this will tell us if the temporal scale of the BCI data is the right one to detect a transient state, but that is outside the scope of this work. 

For the two models I calculate SD with two methods: a) from the regressions used to estimate $D_q$, this means that I used the spatial distributions to calculate it ($SD_r$). b) Using bootstrap with a set of $D_q$ obtained with different realization or simulations of the model ($SD_b$), these are called ensemble statistics. Studying natural processes where ensemble statistics can not be obtained, is usually assumed than spatially calculated statistics approximate ensemble statistics, but this assumption is not generally valid for multifractals [@Marshak1997]. In an ecological context this is called a space-for-time substitution [@Blois2013], I observed differences in SD not in averages but the issue of multifractals spatial distributions and the space for time substitutions deserves more investigation.
When the model is an exact multifractal like p-model $SD_r$ is three times smaller than $SD_b$, this is the expected result because the estimation method for $D_q$ uses autocorrelated data. When I do the same comparison for the neutral model $SD_b$ is ten times smaller than $SD_r$. This implied that the variability between repeated simulations of the model is much lower than the estimated using spatial information. Then as we usually have only the spatial information this can lead us to the erroneous conclusion that we are observing equal $D_q$ while in reality they were distinct. 

The procedure of fitting a model to spatial data and use it for building confidence intervals of spatial indexes, like $D_q$ [@Roberts1996,@Remmel2003], is risky because different models can give different results and if we are not sure about the underlying process it is difficult to represent it's variability. A better approach would be to make a better estimation of variability from the image itself.
To estimate $D_q$ the sandbox algorithm [@DeBartolo2004] with a resampling scheme should be used. This can solve the autocorrelation problem and also, if the area sampled is representative of the process, the problem of different spatial and ensemble statistics ($SD_r$ vs $SD_b$). 

The images of the neutral model with inverse power dispersal seems more similar to BCI images than exponential dispersal ones, this is in agreement with Seri [-@Seri2012]; they found a better fit with a long-distance and scale-free dispersal kernel for spatial patterns of the three most abundant species. I do not use exactly the same kernel but it has the same properties of scale-free and long-distance as the inverse power. I did not do an exact fitting but using $D_q$ you could find which kernel fits better to the whole community not only to individual species. 

Although the estimation of $D_q$ needs some improvement, multifractals can be successfully used to analyze several aspect of community spatial structure. With the advent of the big data era to ecology [@Hampton2013] and the use of new technology to acquire spatial data [@Michener2012]  new methods to analyze complex data sets are needed and multifractals could be an interesting addition to the ecologist's toolbox.

# Author contributions

LS coded to the software discussed in this
paper and write the manuscript.


# Competing interests

No competing interests were disclosed.

# Grant information

The author declared that no grants were involved in supporting
this work.


# Acknowledgments

I am grateful to Fernando R. Momo for our great conversations about ecological theory. I also wish to thank to Diana Marco to the manuscript, and to Graeme Ruxton for his english revision. The BCI forest dynamics research project was made possible by National Science Foundation grants to Stephen P. Hubbell: DEB-0640386, DEB-0425651, DEB-0346488, DEB-0129874, DEB-00753102, DEB-9909347, DEB-9615226, DEB- 9615226, DEB-9405933, DEB-9221033, DEB-9100058, DEB- 8906869, DEB-8605042, DEB-8206992, DEB-7922197, support from the Center for Tropical Forest Science, the Smithsonian Tropical Research Institute, the John D. and Catherine T. MacArthur Foundation, the Mellon Foundation, the Celera Foundation, and numerous private individuals, and through the hard work of over 100 people from 10 countries over the past two decades. The plot project is part of the Center for Tropical Forest Science, a global network of large-scale demographic tree plots.


# References  