# Introduction

This repository contains code for the MT-CKD water vapor continuum model used in [LBLRTM](https://github.com/AER-RC/LBLRTM); the code is written as a callable FORTRAN subroutine that reads a netCDF file (absco-ref_wv-mt-ckd.nc) containing the water vapor continuum coefficients at the reference pressure and temperature.
[Eli to add some background MT_CKD info]

LBLRTM and MT_CKD are linked.The current versions are:


| LBLRTM Release | MT_CKD Release |
| :---: | :---: | :---: |
| [v12.14](https://github.com/AER-RC/LBLRTM/releases/tag/v12.14) | [v4.0](https://github.com/AER-RC/MT_CKD_H2O/releases/tag/4.0) |

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

[This may not be the best location of the netcdf file.
