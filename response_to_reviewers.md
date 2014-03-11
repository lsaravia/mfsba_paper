# Individual response:

## Yuxin Zhang 

I appreciate Dr. Zhang's comments on the manuscript. As the software was developed and tested under Linux it should not be expected to work flawlessly under windows. I agree that I would be a great benefit to release at least a windows working version, I will try to update the software as time and resources are available. But I think that the software should be evaluated as is, and not judged because it's available or not under different operative systems. It will be useful to open issues on github to track the development of the software <https://github.com/lsaravia/mfsba/issues>.

The q's can be real numbers or integers in any range and are specified in the **qFile** as explained on the main text.  

## Edmund Hart
I think the introduction would benefit greatly from clear examples of the benefits and uses of mfSBA. It seems that the author should address both the benefits of multifractal analysis as well as where the SRS improves upon comparisons made by SAD's. It seems that the author has already made some publications that could address this, and it would be useful to have a brief explanation. 

In general I found the Introduction lacking specificity. For instance the author states in the first paragraph: "If they do apply, they reflect constraints in their organization that can provide clues about the underlying mechanism" What constraints? What underlying mechanism is the author referring to? How does it provide clues about this these mechanisms?

Methods and conclusion

I think the most important part here is a clear explanation of the quantities of interest that I can get from mfSBA, and how to interpret them. While parameters like slope and intercept seem obvious to most people now, I had no idea how to interpret q or D_q, or how I would use them.
Furthermore the author focuses on the ability of this new method to make comparisons, stating: "The analysis of SRS using Dq adds a new dimension to the comparison of species spatial distributions, because it can be used to compare spatial distributions of all species at the same time and also the abundances are accounted."
However, the comparison the author makes is very unclear. It would be nice to see a comparison where simulation conditions were clearly made, and perhaps even performed in R so users could tweak them.
Figure 2 provides output for a comparison, but it's unclear how to interpret that comparison. In summary the main text would benefit from a clearer presentation of use cases, what parameters are being estimated, and how to understand those parameters in different scenarios, both simulated and real data.

Software packaging.

I think the average ecologist will find this package still rather intimidating. It requires the installation of
secondary libraries as well as a C compiler. I wouldn't even know how to begin to install this on a
windows machine. I would suggest the author create an R package with precompiled binary libraries for
windows and mac. This combined with an improved manuscript will provide ecologists with a powerful
tool.


Agregué aclaraciones a la introducción
interpretación de Dq
Falta agregar ejemplos de como usar Dq en comparaciones interpretar figure 2 comparar con Borda de agua 2007

Scanlon TM, Caylor KK, Levin SA, Rodriguez-iturbe I (2007) Positive feedbacks promote power-law clustering of Kalahari vegetation. Nature 449: 209–212. doi:10.1038/nature06060.
Kéfi S, Rietkerk M, Alados CL, Pueyo Y, Papanastasis VP, et al. (2007) Spatial vegetation patterns and imminent desertification in Mediterranean arid ecosystems. Nature 449: 213–217. doi:10.1038/nature06111.
Weerman EJ, Van Belzen J, Rietkerk M, Temmerman S, Kéfi S, et al. (2012) Changes in diatom patch-size distribution and degradation in a spatially self-organized intertidal mudflat ecosystem. Ecology 93: 608–618. doi:10.1890/11-0625.1.
Manor A, Shnerb NM (2008) Facilitation, competition, and vegetation patchiness: From scale free distribution to patterns. J Theor Biol 253: 838–842. doi:10.1016/j.jtbi.2008.04.012.
Hill MO (1973) Diversity and Evenness: A Unifying Notation and Its Consequences. Ecology 54: 427–432. doi:10.2307/1934352.
Halsey TC, Jensen MH, Kadanoff LP, Procaccia I, Shraiman BI (1986) Fractal measures and their singularities: The characterization of strange sets. Phys Rev A 33: 1141–1151.
Ricotta C (2000) From theoretical ecology to statistical physics and back: self-similar landscape metrics as a synthesis of ecological diversity and geometrical complexity. Ecol Modell 125: 245 – 253.
Véhel JL, Vojak R (1998) Multifractal Analysis of Choquet Capacities. Adv Appl Math 20: 1–43. doi:10.1006/aama.1996.0517.
Cheng Q, Agrerberg FP (1995) Multifractal modeling and spatial point processes. Math Geol 27: 831–845.

Lévy Véhel J (1998) Introduction to the multifractal analysis of images. In: Fisher Y, editor. Fractal Image Encoding and Analysis. Springer Verlag. pp. 299–341.

Bacry E, Muzy JF, Arnéodo A (1993) Singularity spectrum of fractal signals from wavelet analysis: Exact results. J Stat Phys 70: 635–674. doi:10.1007/BF01053588.

Crowley PH (1992) Resampling methods for computation-intensive data analysis in ecology and evolution. Annu Rev Ecol Syst 23: 405–447.

Wiegand T, Moloney KA (2004) Rings, circles, and null-models for point pattern analysis in ecology. Oikos 104: 209–229. doi:10.1111/j.0030-1299.2004.12497.x.

it is important to realize that comparisons made at more than one point on the function have the effect of inflating Type I error (Loosmore & Ford 2006). Envelope tests should not be thought of as formal tests of significance, although they can still be instructive,


# Update box (250-300 words)

I thank the reviewers for their comments. In response to them I made available a pre-compiled version of the executables for windows and a corrected version of the R scripts.
A description of the program to perform a randomization included in mfSBA was also added.The following is a summary of the changes made in response to reviewer's comments:

* I added some examples and clarifications to the introduction and to make it more specific. 
* I explain that the SRS/MFA methodology is novel and here I do not intend to make a comparison with other methods but only a description of the capabilities of the software.* I also included an interpretation of multifractal spectra D_q based on Hill's generalized diversity. 
* The limitations of mfSBA are more clearly stated.
* I added an explanation of why Dq's are different for figure 2.

 



## References

38. Scanlon TM, Caylor KK, Levin SA, Rodriguez-iturbe I (2007) Positive feedbacks promote power-law clustering of Kalahari vegetation. Nature 449: 209–212. doi:10.1038/nature06060.
39. Kéfi S, Rietkerk M, Alados CL, Pueyo Y, Papanastasis VP, et al. (2007) Spatial vegetation patterns and imminent desertification in Mediterranean arid ecosystems. Nature 449: 213–217. doi:10.1038/nature06111.
40. Weerman EJ, Van Belzen J, Rietkerk M, Temmerman S, Kéfi S, et al. (2012) Changes in diatom patch-size distribution and degradation in a spatially self-organized intertidal mudflat ecosystem. Ecology 93: 608–618. doi:10.1890/11-0625.1.
41. Manor A, Shnerb NM (2008) Facilitation, competition, and vegetation patchiness: From scale free distribution to patterns. J Theor Biol 253: 838–842. doi:10.1016/j.jtbi.2008.04.012.
42. Lévy Véhel J (1998) Introduction to the multifractal analysis of images. In: Fisher Y,
editor. Fractal Image Encoding and Analysis. Springer Verlag. pp. 299–341.
43. Hill MO (1973) Diversity and Evenness: A Unifying Notation and Its Consequences. Ecology 54: 427–432. doi:10.2307/1934352.
44. Ricotta C (2000) From theoretical ecology to statistical physics and back: self-similar landscape metrics as a synthesis of 
45. Halsey TC, Jensen MH, Kadanoff LP, Procaccia I, Shraiman BI (1986) Fractal measures and their singularities: The characterization of strange sets. Phys Rev A 33: 1141–1151.
46. Véhel JL, Vojak R (1998) Multifractal Analysis of Choquet Capacities. Adv Appl Math 20: 1–43. doi:10.1006/aama.1996.0517.
47. Crowley PH (1992) Resampling methods for computation-intensive data analysis in
ecology and evolution. Annu Rev Ecol Syst 23: 405–447.
48. Wiegand T, Moloney KA (2004) Rings, circles, and null-models for point pattern
analysis in ecology. Oikos 104: 209–229. doi:10.1111/j.0030-1299.2004.12497.x.
•

