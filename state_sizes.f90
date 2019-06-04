module state_sizes_module
   use network, only : nspec, naux
   implicit none
   integer, parameter :: nadv = 0
   integer, parameter :: ngroups = 1
   integer, parameter :: NQAUX = 6 + ngroups
   integer, parameter :: NVAR = 8 + nadv + nspec + naux
   integer, parameter :: NGDNV = 6 + ngroups + ngroups
   integer, parameter :: NQ = 11 + nadv + nspec + naux + ngroups
   integer, parameter :: NQSRC = 9
end module state_sizes_module
