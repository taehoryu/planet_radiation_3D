  int gcnt = 0;
  GDRHO = gcnt;
  gcnt += 1;

  GDU = gcnt;
  gcnt += 1;

  GDV = gcnt;
  gcnt += 1;

  GDW = gcnt;
  gcnt += 1;

  GDPRES = gcnt;
  gcnt += 1;

  GDGAME = gcnt;
  gcnt += 1;

#ifdef RADIATION
  if (NGROUPS > 0) {
    GDLAMS = gcnt;
    gcnt += NGROUPS;
  }
#endif

#ifdef RADIATION
  if (NGROUPS > 0) {
    GDERADS = gcnt;
    gcnt += NGROUPS;
  }
#endif

