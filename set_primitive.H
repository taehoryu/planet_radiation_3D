  int qcnt = 0;
  QRHO = qcnt;
  qcnt += 1;

  QU = qcnt;
  qcnt += 1;

  QV = qcnt;
  qcnt += 1;

  QW = qcnt;
  qcnt += 1;

  QGAME = qcnt;
  qcnt += 1;

  QGC = qcnt;
  qcnt += 1;

  QPRES = qcnt;
  qcnt += 1;

  QREINT = qcnt;
  qcnt += 1;

#ifdef MHD
  QMAGX = qcnt;
  qcnt += 1;
#endif

#ifdef MHD
  QMAGY = qcnt;
  qcnt += 1;
#endif

#ifdef MHD
  QMAGZ = qcnt;
  qcnt += 1;
#endif

  QTEMP = qcnt;
  qcnt += 1;

  if (NumAdv > 0) {
    QFA = qcnt;
    qcnt += NumAdv;
  }

  if (NumSpec > 0) {
    QFS = qcnt;
    qcnt += NumSpec;
  }

  if (NumAux > 0) {
    QFX = qcnt;
    qcnt += NumAux;
  }

#ifdef RADIATION
  QPTOT = qcnt;
  qcnt += 1;
#endif

#ifdef RADIATION
  QREITOT = qcnt;
  qcnt += 1;
#endif

#ifdef RADIATION
  if (NGROUPS > 0) {
    QRAD = qcnt;
    qcnt += NGROUPS;
  }
#endif

