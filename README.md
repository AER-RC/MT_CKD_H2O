# Introduction

This repository contains code for the MT-CKD water vapor continuum model used in [LBLRTM](https://github.com/AER-RC/LBLRTM); the code is written as a callable FORTRAN subroutine that reads a netCDF file containing the water vapor continuum coefficients at the reference pressure and temperature.
[Eli to add some background MT_CKD info]

LBLRTM and MT_CKD are linked.The current versions are:



| LBLRTM Release | MT_CKD Release 
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

[Not true for this version yet
```

Though not necessary, the move to `cntnm` is for consistency with previous release packages and the associated documentation.

# Building

To build MT_CKD_H2O as a FORTRAN object, along with the example driver code, using the gfortran compiler 

```
cd MT_CKD/build
make -f make_cntnm linugGNUdbl
```

Other compilers may work but only gfortran has been tested so far.


# Run Example

To run MT_CKD as a standalone program instead of in LBLRTM:

```
cd run_example/
ln -s ../cntnm_v3.6_linux_pgi_dbl cntnm # assuming v3.6 was built with PGI in double precision (linuxPGIdbl)
./cntnm (0, enter)
```

Push 0, then enter, and `CNTNM.OPTDPT` and `WATER.COEF` will be written to working directory. These can be compared with `CNTNM.OPTDPT_mt_ckd_AER` and `WATER.COEF_mt_ckd_AER`, which are included in version control and are considered the baseline calculations. They change with every release and will be updated accordingly.

For other runs of the continuum standalone program, the user can edit `INPUT.example` in the `run_example` directory.
