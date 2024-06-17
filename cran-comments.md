Duration: 55m 4.2s

❯ checking installed package size ... NOTE
    installed size is  7.8Mb
    sub-directories of 1Mb or more:
      doc   7.4Mb

❯ checking top-level files ... NOTE
  Non-standard files/directories found at top level:
    ‘anes1.png’ ‘paper.Rmd’ ‘paper.html’ ‘paper.md’ ‘paper.pdf’
    ‘refs.bib’
  
## Comments to CRAN

Notes:
- doc size is large because the package contains many examples and the output is highly grachical
- Non-standard files are files connected to an article submitted to Journal of Open Source software nd they are not included in the R-package

Package Revisions:
- New workflow integration which only requires the user to state what model identification items should be used by D3mirt()
- New option model, referred to as the orthogonal model, which allows investigating a three-dimensional scale under the assumption that no within-multidimensionality exists
- Respondent trait scores are included in the exported object from D3mirt(), which allows for easy plotting of respondents using plot()
- Constructs can be created using spherical coordinates, which allows for adding constructs anywhere in the latent space
- Test unit included in the package, including a data frame containing multiple standard angles that are used for checking the numerical and graphical results
- Contact information regarding questions, code contribution, and reporting bugs included in the package vignette
- Minor revisions of documentation, code, and description
    
    
## Previos updates and revisions

## Revision 20230823
## R CMD check results

── R CMD check results D3mirt 1.1.0 ────
Duration: 8m 22.6s

❯ checking installed package size ... NOTE
    installed size is  5.2Mb
    sub-directories of 1Mb or more:
      doc   4.9Mb

Comments to CRAN:
- README extended with examples.
- Change of package version to indicate minor update to users.
- Need to resubmit due to errors in creating vignette in the previous submission to CRAN.
- Important documentation revisions offering increased clarity and less redundance.
- More thorough check of layout of the PDF manual
- Putting \dontrun{} around examples regarding exporting the RGL device removed note "Checking for non-standard things in check directory" when running RMD check

## Revision 20230720
── R CMD check results D3mirt 1.0.5 ────
Duration: 8m 25.1s

❯ checking installed package size ... NOTE
    installed size is  5.2Mb
    sub-directories of 1Mb or more:
      doc   4.9Mb

❯ checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ‘RGLdevice.png’

0 errors ✔ | 0 warnings ✔ | 2 notes ✖

Update includes:
- Print method added to the modid() and D3mirt() functions
- Summary method added to the modid() function
- Plot function changed to use generic plot() method
- mirt::mirt() function integrated into modid() and D3mirt()
- Minor revisions of documentation


# Revision ## Revision 20230511
── R CMD check results D3mirt 1.0.3 ────
Duration: 8m 34s

❯ checking installed package size ... NOTE
    installed size is  5.3Mb
    sub-directories of 1Mb or more:
      doc   4.9Mb

❯ checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ‘RGLdevice.png’

0 errors ✔ | 0 warnings ✔ | 2 notes ✖

Update only regards minor adjustments in plot function and documentation

## Revision 20230511
Duration: 8m 33.7s

❯ checking installed package size ... NOTE
    installed size is  5.3Mb
    sub-directories of 1Mb or more:
      doc   4.9Mb

❯ checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ‘RGLdevice.png’

0 errors ✔ | 0 warnings ✔ | 2 notes ✖

Note refers to package size (5.3mb). The package contains many examples, hence the package larger size. Examples are important because the analytical approach is less known and partly contains new components.

The use of \donttest{} creates a .png file in the examples section for the plot function. This leads leads to the following note in the R CMD check: 
"Found the following files/directories:
    ‘RGLdevice.png’"
The .png file, however, does not seem to be saved in the package.


## Revision 20230427
❯ checking installed package size ... NOTE
    installed size is  5.3Mb
    sub-directories of 1Mb or more:
      doc   4.9Mb

❯ checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ‘RGLdevice.png’

0 errors ✔ | 0 warnings ✔ | 2 notes ✖


## Revision 20230427
2PL was changed to two parameter logistic model

`D3mirt` was changed to 'D3mirt'

## Revision 20230426

A longer description of the package has been added in the description file.

Regarding examples in the function documentation, integration with mirt:mirt() takes several minutes and was therefore wrapped in \dontrun{}. 

All examples have now been changed to use \donttest{} instead of \dontrun{} and no errors or warnings are reported when performing the R CMD check.

The use of \donttest{} creates a .png file in the examples section for the plot function. This leads leads to the following note in the R CMD check: 
"Found the following files/directories:
    ‘RGLdevice.png’"
The .png file, however, does not seem to be saved in the package.


## Previous revisions

Note refers to package size (5.3mb). The package contains many examples, hence the package larger size. Examples are important because the analytical approach is less known and partly contains new components.

"+ file LICENSE"" and file "LICENSE" has been removed.
