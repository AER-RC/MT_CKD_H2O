# Introduction

This repository contains code for the MT_CKD water vapor continuum model used in [LBLRTM](https://github.com/AER-RC/LBLRTM); the code is written as a callable FORTRAN subroutine that reads a netCDF file (absco-ref_wv-mt-ckd.nc) containing the water vapor continuum coefficients at the reference pressure and temperature.

The MT_CKD water vapor continuum model is constrained so that it is consistent with quality analyses of spectral atmospheric measurements. Laboratory measurements are also considered. Keeping the MT_CKD continuum consistent with current observational studies necessitates periodic updates to the water vapor continuum coefficients. Details of the most recent revisions to the MT_CKD water vapor continuum can be found in the “What’s New” Wiki page.

Water vapor continuum coefficients in spectral regions that have not been subject to compelling analyses are determined by a mathematical formulation of the spectral shape associated with each water vapor monomer line. This formulation is applied consistently to all water vapor lines from the microwave to the visible, and the results summed (separately for the self and foreign) to obtain continuum coefficients from 0-20,000 cm-1. This formulation has been derived based on the continuum in spectral regions in which the coefficients are known with low uncertainties.

The MT_CKD water vapor continuum model was first implemented in the line-by-line model LBLRTM v7.0 and has been utilized in all subsequent AER Radiative Transfer models. This new model was developed by E.J. Mlawer, D.C. Tobin and S.A. Clough, using the original CKD formulation as its foundation; hence the name MT_CKD.

MT_CKD is consistent with a calculation of the line absorption is cut off 25 cm-1 from the line center, as is done in LBLRTM. The current versions of each code is:


| MT_CKD Release | LBLRTM Release |
| :---: | :---: | 
| [v4.0](https://github.com/AER-RC/MT_CKD_H2O/releases/tag/4.0)| [v12.14](https://github.com/AER-RC/LBLRTM/releases/tag/v12.14) |

If any build or run issues occur, please [create an issue](https://github.com/AER-RC/MT_CKD_H2O/issues) or contact the [AER-RC Group](https://github.com/AER-RC).

# Cloning the Latest Release

Assuming the output directory should be `MT_CKD_H2O`:

`git clone  git@github.com:AER-RC/MT_CKD_H2O.git`



Currently, the latest release is MT_CKD_4.0 , and it is recommended that this be the version that users clone and checkout (rather than the `master` branch). To do this, one needs to simply checkout the `4.0` tag:

```
git checkout tags/4.0
```

Instead of cloning, users can also download an MT_CKD [tarball](https://github.com/AER-RC/MT_CKD/releases/tag/v3.6) and unpack it:

```
tar xvf cntnm_v3.6.tar.gz
mv MT_CKD-3.6 cntnm

[Not true for this version yet]
```

Though not necessary, the move to `cntnm` is for consistency with previous release packages and the associated documentation.

# Building

To build MT_CKD_H2O as a FORTRAN object, along with the example driver code, using the gfortran compiler, type: 

```
cd MT_CKD/build
make -f make_cntnm linugGNUdbl
```

Other compilers may work but only gfortran has been tested so far.


# Run Example

A simple example driver (drive_mt_ckd_h2o.f90) has been provided; it runs from a configuration file (mt_ckd.config) and generates a file of water vapor continuum absorption coefficients (mt_ckd_h2o_output.nc) for the pressure, temperature, water vapor mixing ratio and spectral range and resolution specified in the configuration file. To run the driver in the run_example directory:

cd run_example
../mt_ckd_h2o_v4.0_linux_gnu_dbl < mt_ckd.config

The absco-ref_wv-mt-ckd.nc file and the output from the driver can be found in a separate example package.

