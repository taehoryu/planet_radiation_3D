
! DO NOT EDIT!!!

! This file is automatically created by set_variables.py.  To update
! or add variable indices, please edit _variables and then rerun the
! script.


subroutine check_equal(index1, index2)

  use amrex_error_module

  implicit none

  integer, intent(in) :: index1, index2

#ifndef AMREX_USE_CUDA
  if (index1 /= index2) then
    call amrex_error("ERROR: mismatch of indices")
  endif
#endif

end subroutine check_equal


subroutine ca_set_auxiliary_indices()


  use meth_params_module
  use network, only: naux, nspec
#ifdef RADIATION
  use rad_params_module, only : ngroups
#endif
  implicit none

  QGAMC = 1

  QC = 2

  QDPDR = 3

  QDPDE = 4

#ifdef RADIATION
  QGAMCG = 5
#endif

#ifdef RADIATION
  QCG = 6
#endif

#ifdef RADIATION
  QLAMS = 7
#endif

end subroutine ca_set_auxiliary_indices

subroutine ca_set_conserved_indices( &
#ifdef HYBRID_MOMENTUM
                                    Rmom_in, &
#endif
#ifdef HYBRID_MOMENTUM
                                    Lmom_in, &
#endif
#ifdef HYBRID_MOMENTUM
                                    Pmom_in, &
#endif
#ifdef SHOCK_VAR
                                    Shock_in, &
#endif
                                    Density_in, &
                                    Xmom_in, &
                                    Ymom_in, &
                                    Zmom_in, &
                                    Eden_in, &
                                    Eint_in, &
                                    Temp_in, &
                                    FirstAdv_in, &
                                    FirstSpec_in, &
                                    FirstAux_in &
                                   )


  use meth_params_module
  use network, only: naux, nspec
#ifdef RADIATION
  use rad_params_module, only : ngroups
#endif
  implicit none
  integer, intent(in) :: Density_in
  integer, intent(in) :: Xmom_in
  integer, intent(in) :: Ymom_in
  integer, intent(in) :: Zmom_in
#ifdef HYBRID_MOMENTUM
  integer, intent(in) :: Rmom_in
#endif
#ifdef HYBRID_MOMENTUM
  integer, intent(in) :: Lmom_in
#endif
#ifdef HYBRID_MOMENTUM
  integer, intent(in) :: Pmom_in
#endif
  integer, intent(in) :: Eden_in
  integer, intent(in) :: Eint_in
  integer, intent(in) :: Temp_in
  integer, intent(in) :: FirstAdv_in
  integer, intent(in) :: FirstSpec_in
  integer, intent(in) :: FirstAux_in
#ifdef SHOCK_VAR
  integer, intent(in) :: Shock_in
#endif

  URHO = 1
  call check_equal(URHO,Density_in+1)

  UMX = 2
  call check_equal(UMX,Xmom_in+1)

  UMY = 3
  call check_equal(UMY,Ymom_in+1)

  UMZ = 4
  call check_equal(UMZ,Zmom_in+1)

  UEDEN = 5
  call check_equal(UEDEN,Eden_in+1)

  UEINT = 6
  call check_equal(UEINT,Eint_in+1)

  UTEMP = 7
  call check_equal(UTEMP,Temp_in+1)

  if (nadv > 0) then
    UFA = 8
  else
    UFA = 0
  endif
  call check_equal(UFA,FirstAdv_in+1)

  if (nspec > 0) then
    UFS = 8 + nadv
  else
    UFS = 0
  endif
  call check_equal(UFS,FirstSpec_in+1)

  if (naux > 0) then
    UFX = 8 + nadv + nspec
  else
    UFX = 0
  endif
  call check_equal(UFX,FirstAux_in+1)

#ifdef SHOCK_VAR
  USHK = 8 + nadv + nspec + naux
  call check_equal(USHK,Shock_in+1)
#endif

end subroutine ca_set_conserved_indices

subroutine ca_set_godunov_indices( &
#ifdef RADIATION
                                  GDLAMS_in, &
#endif
#ifdef RADIATION
                                  GDERADS_in, &
#endif
                                  GDRHO_in, &
                                  GDU_in, &
                                  GDV_in, &
                                  GDW_in, &
                                  GDPRES_in, &
                                  GDGAME_in &
                                 )


  use meth_params_module
  use network, only: naux, nspec
#ifdef RADIATION
  use rad_params_module, only : ngroups
#endif
  implicit none
  integer, intent(in) :: GDRHO_in
  integer, intent(in) :: GDU_in
  integer, intent(in) :: GDV_in
  integer, intent(in) :: GDW_in
  integer, intent(in) :: GDPRES_in
  integer, intent(in) :: GDGAME_in
#ifdef RADIATION
  integer, intent(in) :: GDLAMS_in
#endif
#ifdef RADIATION
  integer, intent(in) :: GDERADS_in
#endif

  GDRHO = 1
  call check_equal(GDRHO,GDRHO_in+1)

  GDU = 2
  call check_equal(GDU,GDU_in+1)

  GDV = 3
  call check_equal(GDV,GDV_in+1)

  GDW = 4
  call check_equal(GDW,GDW_in+1)

  GDPRES = 5
  call check_equal(GDPRES,GDPRES_in+1)

  GDGAME = 6
  call check_equal(GDGAME,GDGAME_in+1)

#ifdef RADIATION
  if (ngroups > 0) then
    GDLAMS = 7
  else
    GDLAMS = 0
  endif
  call check_equal(GDLAMS,GDLAMS_in+1)
#endif

#ifdef RADIATION
  if (ngroups > 0) then
    GDERADS = 7 + ngroups
  else
    GDERADS = 0
  endif
  call check_equal(GDERADS,GDERADS_in+1)
#endif

end subroutine ca_set_godunov_indices

subroutine ca_set_primitive_indices( &
#ifdef MHD
                                    QMAGX_in, &
#endif
#ifdef MHD
                                    QMAGY_in, &
#endif
#ifdef MHD
                                    QMAGZ_in, &
#endif
#ifdef RADIATION
                                    QPTOT_in, &
#endif
#ifdef RADIATION
                                    QREITOT_in, &
#endif
#ifdef RADIATION
                                    QRAD_in, &
#endif
                                    QRHO_in, &
                                    QU_in, &
                                    QV_in, &
                                    QW_in, &
                                    QGAME_in, &
                                    QGC_in, &
                                    QPRES_in, &
                                    QREINT_in, &
                                    QTEMP_in, &
                                    QFA_in, &
                                    QFS_in, &
                                    QFX_in &
                                   )


  use meth_params_module
  use network, only: naux, nspec
#ifdef RADIATION
  use rad_params_module, only : ngroups
#endif
  implicit none
  integer, intent(in) :: QRHO_in
  integer, intent(in) :: QU_in
  integer, intent(in) :: QV_in
  integer, intent(in) :: QW_in
  integer, intent(in) :: QGAME_in
  integer, intent(in) :: QGC_in
  integer, intent(in) :: QPRES_in
  integer, intent(in) :: QREINT_in
#ifdef MHD
  integer, intent(in) :: QMAGX_in
#endif
#ifdef MHD
  integer, intent(in) :: QMAGY_in
#endif
#ifdef MHD
  integer, intent(in) :: QMAGZ_in
#endif
  integer, intent(in) :: QTEMP_in
  integer, intent(in) :: QFA_in
  integer, intent(in) :: QFS_in
  integer, intent(in) :: QFX_in
#ifdef RADIATION
  integer, intent(in) :: QPTOT_in
#endif
#ifdef RADIATION
  integer, intent(in) :: QREITOT_in
#endif
#ifdef RADIATION
  integer, intent(in) :: QRAD_in
#endif

  QRHO = 1
  call check_equal(QRHO,QRHO_in+1)

  QU = 2
  call check_equal(QU,QU_in+1)

  QV = 3
  call check_equal(QV,QV_in+1)

  QW = 4
  call check_equal(QW,QW_in+1)

  QGAME = 5
  call check_equal(QGAME,QGAME_in+1)

  QGC = 6
  call check_equal(QGC,QGC_in+1)

  QPRES = 7
  call check_equal(QPRES,QPRES_in+1)

  QREINT = 8
  call check_equal(QREINT,QREINT_in+1)

  QTEMP = 9
  call check_equal(QTEMP,QTEMP_in+1)

  if (nadv > 0) then
    QFA = 10
  else
    QFA = 0
  endif
  call check_equal(QFA,QFA_in+1)

  if (nspec > 0) then
    QFS = 10 + nadv
  else
    QFS = 0
  endif
  call check_equal(QFS,QFS_in+1)

  if (naux > 0) then
    QFX = 10 + nadv + nspec
  else
    QFX = 0
  endif
  call check_equal(QFX,QFX_in+1)

#ifdef RADIATION
  QPTOT = 10 + nadv + nspec + naux
  call check_equal(QPTOT,QPTOT_in+1)
#endif

#ifdef RADIATION
  QREITOT = 11 + nadv + nspec + naux
  call check_equal(QREITOT,QREITOT_in+1)
#endif

#ifdef RADIATION
  if (ngroups > 0) then
    QRAD = 12 + nadv + nspec + naux
  else
    QRAD = 0
  endif
  call check_equal(QRAD,QRAD_in+1)
#endif

end subroutine ca_set_primitive_indices

