 program main

! test drives the mt_ckd_h2o module

   use mt_ckd_h2o

   implicit none

   include "netcdf.inc"

   real :: p_atm,t_atm,h2o_frac
   real :: dwv
   double precision :: wv1,wv2
   real, dimension(:),allocatable :: sh2o,fh2o
   double precision,dimension(:),allocatable :: wvn
   logical :: radflag=.TRUE.
   character(len=81) :: mt_version

   integer :: nwv,i
   integer :: istat,ncid,id_wv,idvar(3)
   character :: FRGNX

   namelist /mt_ckd_input/ p_atm,t_atm,h2o_frac,wv1,wv2,dwv
  
   read (*,mt_ckd_input)

   
   nwv = (wv2-wv1)/dwv+1
   allocate(wvn(nwv))
   allocate (sh2o(nwv))
   allocate (fh2o(nwv))

   call mt_ckd_h2o_absco (p_atm,t_atm,h2o_frac,wv1,wv2,dwv,sh2o,fh2o, &
      FRGNX,radflag=radflag,mt_version=mt_version)
   print *,'mt_version ',mt_version
   wvn = wv1+[(i,i=0,nwv-1)]*dwv

! Create netCDF file
   istat= nf_create("mt_ckd_h2o_output.nc",nf_clobber,ncid) 
   istat= nf_def_dim(ncid,"wavenumbers",nwv,id_wv) 
   istat= nf_def_var(ncid,'wavenumbers',nf_double,1,id_wv,idvar(1)) 
   istat= nf_def_var(ncid,'self_absorption',nf_double,1,id_wv,idvar(2)) 
   istat= nf_def_var(ncid,'frgn_absorption',nf_double,1,id_wv,idvar(3))

   istat= nf_put_att_text (ncid,idvar(1),"units",4,"cm-1") 
   istat= nf_put_att_text (ncid,idvar(1),"description",11,"Wavenumbers")
   istat= nf_put_att_text (ncid,idvar(2),"units",19,"cm**2/molecule cm-1") 
   istat= nf_put_att_text (ncid,idvar(2),"description",50,"Water vapor continuum self absorption coefficients ")
   istat= nf_put_att_text (ncid,idvar(3),"units",19,"cm**2/molecule cm-1") 
   istat= nf_put_att_text (ncid,idvar(3),"description",53,"Water vapor foreign continuum absorption coefficients")

   istat= nf_enddef(ncid)

!  Store variables 

   istat= nf_put_var(ncid, idvar(1), wvn)
   istat= nf_put_var(ncid, idvar(2), sh2o)
   istat= nf_put_var(ncid, idvar(3), fh2o)

!Close netcdf file
   istat= nf_close(ncid)
   
end
  
  
