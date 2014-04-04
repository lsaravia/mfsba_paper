# mfSBA: Multifractal analysis of spatial patterns in ecological communities [v1; ref status: approved with reservations 2, http://f1000r.es/2p4]


**Leonardo A. Saravia**, Ph.D.

Instituto de Ciencias Básicas

Universidad Nacional de General Sarmiento

J.M. Gutierrez 1159 (1613), Los Polvorines

Buenos Aires, Argentina.

<lsaravia@ungs.edu.ar>

\newpage

## Abstract

Multifractals have been applied to characterize complex communities in a
spatial context. They were developed for nonlinear systems and are particularly
suited to capture multiplicative processes observed in ecological systems.
Multifractals characterize variability in a scale-independent way within an
experimental range. I have developed an open-source software package to
estimate multifractals using a box-counting algorithm (available from
<https://github.com/lsaravia/mfsba> and permanently available at doi:
10.5281/zenodo.7659). The software is specially designed for two dimensional
(2D) images such as the ones obtained from remote sensing, but other 2D data
types can also be analyzed. Additionally I developed a new metric to analyze
multispecies spatial patterns with multifractals: spatial rank surface, which is
included in the software.

\newpage
	
## Introduction

Multifractals and fractals are related techniques mainly used in physics to characterize the scaling behavior of a system; they differ in that fractals look at the geometry of presence/absence patterns, while multifractals look at the arrangement of quantities such as population densities or biomass [@Saravia2012a]. Scaling laws are an emergent general feature of ecological systems, and there is no *a priori* reason that power laws apply to ecological communities. If they do apply, they reflect constraints in their organization that can provide clues about the underlying mechanisms[@Brown2002; @Sole2006].

Multifractals require that the object under study should be statistically self-similar, which means that a power-law could be fitted to data in a range of scales. But that does not mean that the power-law must be the best possible model. We can analyze the data without claiming that it is an exact multifractal. One of the advantages of multifractals is that they require fewer conditions on data than more classical statistics such as autocorrelation and variograms. These usually require isotropy and stationarity [@Fortin2006] but multifractals can be used with anisotropic data [@Harte2001] and are inherently non-stationary [@Laurie2010; @Bez2010]. Anisotropy and non-stationarity are often seen in spatial ecological distributions [@Plotkin2002].

Multifractals are associated with systems governed by random multiplicative processes [@Stanley1988]. In ecological systems, these processes can be given as the interaction of survival probabilities and compound growth [@McGill2003a]. Moreover, the presence of multiplicative process is argued to produce the log-normal-like shape of species-abundance distributions [@May2007a]. Also, random processes with spatial correlations can generate multifractals [@Stanley1988]; these kind of processes are part of neutral community models [@Houchmandzadeh2003;@Yakimov2013] and are observed in natural communities [@Condit2000]. Thus there are *a priori* reasons to think that multifractals can be applied to spatial ecological data. Indeed, they have been applied to vegetal communities [@Scheuring1994], tropical forest [@Manrubia1996], microphytobentos and periphyton biomass patterns [@Seuront2002; @Saravia2012a], and to the characterization of species-area relationships [@Borda-de-Agua2002; @Yakimov2008; @Laurie2011].

Rank-abundance distributions are a representation of species-abundance distributions (SAD) that are a classical description of communities [@Mcgill2007]. These have been used to compare different communities and to compare models and data, but different mechanisms can produce nearly identical SADs [@Chave2002]. SADs are often presented using rank-abundance diagrams (RAD) where the log-abundance is plotted on the y-axis vs. rank on the x-axis [@Mcgill2007]. RADs are equivalent to cumulative distributions [@Newman2005] and thus are a robust way to visualize the SAD without losing information [@Li2005]. If the rank of each species is incorporated in its spatial distribution, it forms a surface: the species-rank surface (SRS). This SRS can be analyzed and compared using multifractals.

But the application of multifractals is not widespread [@Seuront2009]; one of the reasons being the difficulty of using the available software for quantitative multifractal analysis (MFA). Here I present an open source software package for the application of multifractals, which can be integrated with R statistical software [@RCoreTeam2013].

## Multifractal analysis

Several good introductions to multifractal methods applied to ecology are available [@Scheuring1994; @Borda-de-Agua2007]; thus I will only give a brief overview. Multifractals analyze the scaling properties of quantities distributed in a space that we assume to be two dimensional (a plane), but MFA can be used with one dimensional (time series) or three dimensional data [@Lopes2009]. A classical way to characterize multifractals is using the generalized dimensions $D_q$ [@Grassberger1983], also called Renyi dimensions [@Renyi1970]. $D_q$ has been used to characterize the probabilistic structure of attractors derived from dynamical systems [@Harte2001].

Another way to characterize multifractals is using the so called spectrum of singularities. This spectrum describes multifractals as interwoven sets each one with a singularity exponent $\alpha$ and a fractal dimension $f(\alpha)$ [@Chhabra1989]. The two multifractal representations are equivalent, they display the same information in a different format. But with the spectrum of singularities, two quantities are estimated ($\alpha$ & $f(\alpha)$) from data and are obtained with error. Instead, with generalized dimension only one quantity is estimated $D_q$, thus this method is preferred for statistical comparisons.

## Estimation

To estimate multifractal spectra I used the method of moments based on box-counting [@Halsey1986]. I estimate generalized dimensions and the spectrum of singularities at the same time using the canonical method [@Chhabra1989]. Here I describe only the $D_q$ estimation; the steps for $\alpha$ and $f(\alpha)$ estimation are identical (only the formulae to calculate the quantities are different and can be found in the appendix of Saravia et al. (2012) [@Saravia2012a]).

The spatial distribution that we are analyzing is covered with a grid, which is divided into $N(\epsilon)$ squares of side $\epsilon$. The contents of each square is called $\mu_i(\epsilon)$. Then the so called partition function is computed as:

 (@e1) $Z_{q}(\epsilon)={\displaystyle \sum_{i}^{N(\epsilon)}} \left(\mu_{i}(\epsilon)\right)^{q}$

Where $q$ is called moment order. The operation is performed for different values of $\epsilon$ and $q$, within a predetermined range. The generalized dimension is calculated as:

 (@e2) $D_{q}=\cfrac{1}{q-1}\underset{\epsilon\to0}{\lim}\cfrac{\log\left(Z_{q}(\epsilon)\right)}{\log\epsilon}$

When $q = 1$, the denominator of the first term in $D_q$ is undefined, so it must be replaced by the following expression:

 (@e3) $D_{q}=\underset{\epsilon\to0}{\lim}\cfrac{{\displaystyle \sum_{i}^{N(\epsilon)}}\mu_{i}(\epsilon)\log\left(\mu_{i}(\epsilon)\right)}{\log\epsilon}$

In practical cases, as the limit can not be assessed, the dimensions are estimated as the slope of $log(Z_q)$ versus $log(\epsilon)$ in equation (@e1) (Figure 1). This is done for different $q$, provided that it is a real number which yields a graph of $D_q$ in terms of $q$, called the spectrum of generalized dimensions (Figure 2).

To be an approximate multifractal, the relationship $log(Z_q)$ versus $log(\epsilon)$ should be well described by a linear relationship, although a linear relationship with superimposed oscillations is also acceptable [@Borda-de-Agua2007]. A range of $q$ and $\epsilon$ is fixed and then $D_q$ is estimated using linear regressions. The coefficient of determination ($R^2$) can be used as a descriptive measure of goodness of fit [@Borda-de-Agua2002].

## Use of mfSBA software

The software was built and tested under Ubuntu 12.04 LTS Linux environment, using the GNU C++ compiler (v4.6.3). It requires the libtiff library for reading tiff images. It can be compiled under Windows environments using the GNU compiler and utilities for that operative system, but it was not tested.

You can download or clone mfSBA from <https://github.com/lsaravia/mfsba> (using ```git clone```) and build it using the make utility.

     make -f mfSBA.mak

You can run it from the command line using the following command structure:

	 mfSBA inputFile qFile minBox maxBox numBoxSizes option

the parameters are:

* **inputFile**: this file can have only two formats: 1) one-layer tiff 2) "sed" file format. 
Sed is an ascii format I invented to use with my own stochastic cellular automata models to represent a square grid of values. It has a header of two lines: the first line describes the two dimensions X Y of the data, and the second line describes the type of data. For this program, the type must be BI, which means that the values stored in the grid are real numbers with double precision. See the example file with a ".sed" extension.

* **qFile**: this is a sed file with a vector of values representing the q's used to calculate the multifractal spectrum.

* **minBox,maxBox,numBoxSizes**: Minimum box size, maximum box size and maximum number of box sizes. The program uses box sizes in powers of two: if **maxBox** is greater than half of the image size, it is set to that value. If the number of boxes between **minBox** and **maxBox** is greater than **numBoxSizes**, the latter number of boxes will be used, discarding the biggest ones.

* **option**: is an upper case character with four possibilities: N,S,D,A.

    + N: analyze the input file as is.
    + S: normalize the input file then analyze it. Normalization is done summing all the pixels values and dividing each pixel by that total. After that the sum of all values is one.
    + D: add 1 to all the pixels then normalize as in S.
    + A: normalize as in S and save the normalized image as a sed file.

Examples of input files are included with the source code, thus after compiling you could run the following command assuming a linux system:

	./mfSBA b4-991008bio.sed q21.sed 2 256 20 S

## Output 

The program generates four output files, attaching a prefix to the original input file name:

* *t.inputFile*: this file has a header line with field names and $q+2$ columns. The first two columns are the box sizes and log box sizes used in the estimation. After that, each column corresponds to $\log\left(Z_{q}(\epsilon)\right)$ of equation (@e2) with the $q$'s specified in the **qFile**. This file could be used to visually check the linearity assumptions to calculate $D_q$ as in Figure 1.

* *a.inputFile* & *f.inputFile*: are similar to the previous file, but used to calculate $\alpha$ and $f(\alpha)$. The formulae are described in the appendix of Saravia et al. (2012) [@Saravia2012a].

* *s.inputFile*: this file has a header line with field names and 10 columns. The first column is $q$. The second column is called Tau and is the result of the regression to calculate the limit in equation 2. Thus to obtain $D_q$ we have to divide it by $q-1$, except in the case of $q=1$ that we take the value of the next column to get $D_q$. The third column is the value of $\alpha$ and the forth column $f(\alpha)$. After that, columns are the corresponding coefficients of determination $R^2$ and standard deviations.

## Species rank surface

I propose to extend the analysis of SAD attaching the rank of each species to its spatial distribution. In this way, the multivariate spatial distribution of all species can be summarized into a univariate distribution. I called this spatial distribution the species-rank surface (SRS), and it can be analyzed and compared using MFA. To construct the SRS, I first calculate the rank-ordering of the species by their abundance from biggest to smallest, starting from one. Then the rank is assigned to the spatial position of the individuals of each species, forming a surface. This landscape has valleys formed by the most abundant species and peaks determined by the rarest species, and the standard MFA can be applied. The program used to calculate this is called multiSpeciesSBA, and is included with the mfSBA source code. You can compile it using the following command:

	 make -f multiSpeciesSBA.mak

Then all the input files and parameters are identical to mfSBA except that the program expects an **inputFile** containing a multispecies distribution. So the **inputFile** should be composed of integer numbers each one representing one species. An example of a sed file with a multispecies spatial distribution is given in t64-0100.sed, this file was obtained using a spatially explicit neutral model with 64 species (available at <https://github.com/lsaravia/neutral>). You can use the following command to perform the MFA:

	 ./multiSpeciesSBA t64-0100.sed q21.sed 2 128 20 N

## R integration

Included with the source is a set of functions as an example to integrate the mfSBA software with the R language. You can load the functions inside R with:

	source('Fun_MFA.r')

and then run the same given examples:

	dq1<- calcDq_mfSBA("b4-991008bio.sed","q21.sed 2 256 20 S")

An interesting example is to compare the $D_q$ from the example multispecies spatial distribution untransformed

	dq1<- calcDq_mfSBA("t64-0100.sed","q21.sed 2 512 20 S",T)

	dq1$Site <- "Untransformed"

with the $D_q$ from SRS

	dq<- calcDq_multiSBA("t64-0100.sed","q21.sed 2 512 20 S",T)

	dq$Site <- "Species Rank Surface"

	dq <- rbind(dq,dq1)

and plot $D_q$ with

	plot_DqCI(dq)

In this plot (Figure 1), we can see that the rank ordering of the species in SRS is crucial to obtain a meaningful result. The $D_q$ calculated from the unordered distribution is nearly flat, this corresponds to an almost constant spatial distribution with uncorrelated random noise.

The plot of the *t.inputFile* (Figure 2) gives a visual check of the regressions to obtain $D_q$:

	plotDqFit("t.t64-0100.sed","q21.sed")

additionally the $R^2$ values could be easily checked:

	hist(dq1$R.Dq)

All the examples and more graphics are included in the file testMFA.r.

# Conclusion 

The multifractal spectrum can be used to describe spatial patterns of biomass, density, height, or any continuous variable. The mfSBA software is especially useful for remote sensing data because it can be used with tiff images. Multifractal patterns could be produced by the existence of multiplicative interaction between species and by spatially correlated random processes such as dispersal and growth [@Stanley1988]. Plant and animal species are generally aggregated in space thus is very likely that multifractal analysis can be used in a wide range of cases.

The analysis of SRS using $D_q$ adds a new dimension to the comparison of species spatial distributions, because it can be used to compare spatial distributions of all species at the same time and also the abundances are accounted. An exploration of the results of different spatial patterns should be needed as a continuation of the present work.

The software presented here is oriented to obtain multifractal spectra for comparisons, rather than to obtain the true value. While the estimation methods used in mfSBA could be improved [@Borda-de-Agua2007; @DeBartolo2006], it has been used without trouble with the kind of data obtained in ecological studies [@Saravia2012; @Saravia2012a].

Multifractals can be successfully used to analyze several aspects of community spatial structure. With the advent of the big data era in ecology [@Hampton2013] and the use of new technology to acquire spatial data [@Michener2012], new methods to analyze complex data sets are needed and multifractals could be an interesting addition to the ecologist's toolbox.

## Software availability

Zenodo: Multifractal estimation using a standard box-counting algorithm, doi: 10.5281/zenodo.7659 [@Saravia2014]

GitHub: Multifractal estimation using a standard box counting algorithm, <https://github.com/lsaravia/mfsba>

## Competing interests

No competing interests were disclosed.

## Grant information

The author(s) declared that no grants were involved in supporting this work.

## Acknowledgments

I am grateful to Fernando R. Momo for our great conversations about ecological theory and David J. Harris for his language revision.

## Figure Legends

Figure 1. Plot of the linear regressions for different $q$ used to estimate the $D_q$ multifractal spectrum.

Figure 2. $D_q$ multifractal spectrum calculated from species spatial distributions.If each species is assigned a number at random (unordered) the $D_q$ is almost flat corresponding to a uniform plus random noise distribution. But when the species rank surface (SRS) is used the $D_q$ spectrum have a wide range of values. The error bars are the standard deviation obtained from the linear regressions used to estimate $D_q$.


## References  