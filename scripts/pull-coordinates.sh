#!/bin/bash
declare -a arr="
41001 
41002 
41003 
41004 
41005 
41006 
41040 
41008 
41009 
41010 
41044 
41012 
41013 
41048 
41016 
41017 
41018 
41021 
41022 
41056 
41024 
41025 
41027 
41029 
41030 
41033 
41035 
41036 
41037 
41038 
41040 
41041 
41043 
41044 
41046 
41047 
41048 
41049 
41051 
41052 
41053 
41056 
41090 
41060 
41061 
41095 
41096 
41064 
41108 
41109 
41110 
41112 
41113 
41114 
41115 
41140 
41141 
41159 
41193 
41194 
41NT1 
41NT2 
42001 
42002 
42003 
42004 
42005 
42006 
42007 
42008 
42009 
42010 
42011 
42012 
42013 
42014 
42015 
42016 
42050 
42051 
42019 
42020 
42021 
42022 
42023 
42025 
42035 
42036 
42037 
42038 
42039 
42040 
42041 
42075 
42043 
42044 
42045 
42046 
42047 
42086 
42054 
42055 
42056 
42057 
42058 
42059 
42060 
42065 
42067 
42080 
42085 
42120 
42121 
42089 
42123 
42130 
42098 
42099 
42360 
42361 
42362 
42363 
42364 
42365 
42369 
42370 
42374 
42375 
42376 
42390 
42392 
42394 
42395 
42887 
42935 
42A02 
42A03 
42OTP 
43043 
44001 
44004 
44005 
44006 
44007 
44008 
44009 
44010 
44011 
44012 
44013 
44014 
44015 
44017 
44018 
44019 
44020 
44021 
44022 
44056 
44024 
44025 
44059 
44027 
44028 
44029 
44030 
44031 
44032 
44033 
44034 
44035 
44037 
44038 
44039 
44040 
44041 
44042 
44043 
44077 
44052 
44053 
44054 
44055 
44056 
44057 
44058 
44059 
44060 
44061 
44062 
44063 
44064 
44065 
44066 
44067 
44068 
44102 
44070 
44105 
44122 
44123 
44091 
44125 
44093 
44094 
44095 
44096 
44097 
44098 
44099 
44100 
44172 
44268 
45001 
45002 
45003 
45004 
45005 
45006 
45007 
45008 
45042 
45010 
45044 
45012 
45013 
45014 
45015 
45016 
45050 
45018 
45052 
45020 
45022 
45023 
45024 
45025 
45026 
45027 
45028 
45029 
45161 
45162 
45163 
45164 
45165 
45166 
45167 
45168 
45169 
45170 
45171 
45172 
45173 
45174 
45175 
45209 
45210 
46001 
46002 
46003 
46004 
46005 
46006 
46007 
46008 
46009 
46010 
46011 
46012 
46013 
46014 
46015 
46016 
46017 
46018 
46019 
46020 
46021 
46022 
46023 
46024 
46025 
46026 
46027 
46028 
46029 
46030 
46031 
46032 
46033 
46034 
46035 
46036 
46037 
46038 
46039 
46040 
46041 
46042 
46076 
46044 
46045 
46047 
46048 
46050 
46051 
46053 
46054 
46059 
46060 
46061 
46062 
46063 
46066 
46069 
46070 
46071 
46072 
46073 
46107 
46075 
46076 
46077 
46078 
46079 
46080 
46081 
46082 
46083 
46084 
46085 
46086 
46087 
46088 
46089 
46091 
46092 
46093 
46094 
46096 
46130 
46131 
46132 
46133 
46105 
46106 
46107 
46108 
46109 
46110 
46111 
46112 
46113 
46114 
46151 
46152 
46153 
46154 
46155 
46157 
46158 
46126 
46160 
46171 
46139 
46211 
46212 
46213 
46214 
46215 
46216 
46217 
46218 
46219 
46253 
46221 
46222 
46223 
46224 
46225 
46226 
46260 
46228 
46229 
46230 
46231 
46232 
46233 
46234 
46235 
46236 
46237 
46238 
46239 
46240 
46241 
46242 
46243 
46244 
46245 
46246 
46247 
46248 
46249 
46283 
46251 
46252 
46253 
46254 
46255 
46256 
46257 
46291 
46292 
46A35 
46A54 
47105 
48011 
48012 
48114 
48211 
48212 
48213 
48214 
48249 
48249 
51000 
51001 
51002 
51003 
51004 
51005 
51026 
51027 
51028 
51100 
51101 
51200 
51201 
51202 
51203 
51204 
51205 
51206 
51207 
51208 
51209 
51243 
51WH1 
51WH2 
52009 
52200 
52201 
52202 
52211 
52212 
91204 
91222 
91251 
91328 
91338 
91343 
91352 
91355 
91365 
91374 
91377 
91411 
91442 
AAMC1 
ABAN6 
ACMN4 
ACYN4 
ADKA2 
AGCM4 
AGMW3 
AGXC1 
ALIA2 
ALRF1 
ALSN6 
ALXN6 
AMAA2 
AMRL1 
ANCF1 
ANMF1 
ANTA2 
ANVC1 
APAM2 
APCF1 
APNM4 
APRP7 
AROP4 
ARPF1 
ASTO3 
ATGM1 
ATKA2 
AUDP4 
AUGA2 
AVAN4 
AWRT2 
BABT2 
BARA9 
BARN6 
BATN6 
BAXC1 
BDRN4 
BDSP1 
BDVF1 
BDXC1 
BEPB6 
BFTN7 
BGCF1 
BGNN4 
BHBM3 
BHRC3 
BHRI3 
BIGM4 
BISM2 
BKBF1 
BKTL1 
BKYF1 
BLIA2 
BLIF1 
BLTA2 
BLTM2 
BLTM3 
BNKF1 
BOBF1 
BRBN4 
BRHC3 
BRND1 
BSBM4 
BSCA1 
BTHD1 
BUFN6 
BURL1 
BUSL1 
BUZM3 
BWSF1 
BYGL1 
BZBM3 
C58W3 
CAMF1 
CAMM2 
CANF1 
CAPL1 
CARL1 
CARO3 
CASM1 
CBBV2 
CBIM2 
CBLO1 
CBRW3 
CCUF1 
CDEA2 
CDRF1 
CECC1 
CFWM1 
CGCL1 
CHAO3 
CHAV3 
CHCM2 
CHDS1 
CHII2 
CHLV2 
CHSV3 
CHTS1 
CHYV2 
CHYW1 
CLBP4 
CLKN7 
CLLT2 
CLSM4 
CMAN4 
CMTI2 
CNBF1 
CNDO1 
CNII2 
COVM2 
CPMW1 
CPNT2 
CPTR1 
CPVM2 
CPXC1 
CQUC1 
CRTA1 
CRVA2 
CRYV2 
CSBF1 
CSPA2 
CTGM1 
CWAF1 
CWBF1 
CYGM4 
DBLN6 
DELD1 
DESW1 
DISW3 
DKCM6 
DKKF1 
DMNO3 
DMSF1 
DOMV2 
DPIA1 
DPXC1 
DRFA2 
DRYF1 
DSLN7 
DTLM4 
DUCN7 
DUKN7 
DULM5 
EB01 
EB10 
EB31 
EB32 
EB33 
EB35 
EB36 
EB43 
EB52 
EB53 
EB61 
EB62 
EB70 
EB90 
EB91 
EB92 
EBSW1 
EGKF1 
EINL1 
ELFA2 
EPTT2 
EREP1 
EROA2 
ERTF1 
ESPP4 
FAIO1 
FARP2 
FBIS1 
FBPS1 
FCGT2 
FFIA2 
FGBL1 
FHPF1 
FILA2 
FMOA1 
FMRF1 
FOXR1 
FPKG1 
FPSN7 
FPTM4 
FPTT2 
FPXC1 
FRCB6 
FRDF1 
FRDP4 
FRDW1 
FREL1 
FRFN7 
FRPS1 
FRVM3 
FRWL1 
FRXM3 
FSKM2 
FSNM2 
FSTI2 
FTGM4 
FTPC1 
FWIC3 
FWYF1 
GBCL1 
GBIF1 
GBLW3 
GBTF1 
GCVF1 
GDIL1 
GDIV2 
GDMM5 
GELO1 
GISL1 
GKYF1 
GLLN6 
GLPT2 
GNJT2 
GPOM6 
GPST2 
GRBL1 
GRIM4 
GRMM4 
GRRT2 
GSLM4 
GTBM4 
GTLM4 
GTOT2 
GTRM4 
GWPM6 
HBXC1 
HBYC1 
HCEF1 
HCGN7 
HHLO1 
HIST2 
HLNM4 
HMDO3 
HMSA2 
HPLM2 
HRBM4 
HREF1 
HRVC1 
HSSF1 
ICAC1 
ICYA2 
IIWC1 
ILDL1 
ILOH1 
IMGP4 
IOSN3 
IRDT2 
ITKA2 
JAKI2 
JKYF1 
JMLA2 
JMPN7 
JNEA2 
JPRN7 
JXUF1 
KATA1 
KDAA2 
KECA2 
KGCA2 
KLIH1 
KNOH1 
KNSW3 
KPTN6 
KPTV2 
KTNF1 
KWHH1 
KWJP8 
KWNW3 
KYWF1 
LABL1 
LAMV3 
LAPW1 
LBRF1 
LBSF1 
LCIY2 
LCLL1 
LCNA2 
LDLC3 
LDTM4 
LJAC1 
LJPC1 
LKPL1 
LKWF1 
LLBP7 
LMBV4 
LMDF1 
LMFS1 
LMRF1 
LMSS1 
LNDC1 
LNEL1 
LONF1 
LOPL1 
LOPW1 
LPNM4 
LPOI1 
LPRP4 
LPWA2 
LRIF1 
LRKF1 
LSCM4 
LSNF1 
LTBV3 
LTJF1 
LTRM4 
LUIT2 
LUML1 
LWSD1 
LWTV2 
LYBT2 
MACM4 
MBET2 
MBLA1 
MBPA1 
MBRM4 
MBXC1 
MCGA1 
MCGM4 
MCYF1 
MCYI3 
MDRM1 
MEEM4 
MEYC1 
MGIP4 
MGPT2 
MGZP4 
MHPA1 
MHRN6 
MISC3 
MISM1 
MISMA 
MISN6 
MISP4 
MIST2 
MKGM4 
MLRF1 
MLSC1 
MLTO3 
MLWW3 
MNMM4 
MNPV2 
MOKH1 
MPCL1 
MQTT2 
MRCP1 
MRHO1 
MRKA2 
MRNA2 
MROS1 
MRSL1 
MRYA2 
MTBF1 
MTKN6 
MTYC1 
MUKF1 
MYPF1 
MYXC1 
MZXC1 
NABM4 
NBBA3 
NBLP1 
NCDV2 
NCHT2 
NCSC3 
NEAW1 
NFBF1 
NFDF1 
NGLT2 
NIAN6 
NKLA2 
NKTA2 
NLMA3 
NLNC3 
NMTA2 
NOSC3 
NPDW3 
NPSF1 
NRRF1 
NSTP6 
NTBC1 
NTKM3 
NUET2 
NWCL1 
NWHC3 
NWPO3 
NWPR1 
NWWH1 
OBGN6 
OBLA1 
OBXC1 
OCGN4 
OCIM2 
OCPN7 
OCSM2 
OFPN6 
OHBC1 
OKSI2 
OKXC1 
OLCN6 
OLSA2 
OMHC1 
OOUH1 
OPTF1 
ORIN7 
OSGN6 
OTNM4 
OVIA2 
PACF1 
PACT2 
PBPA2 
PCBF1 
PCGT2 
PCLF1 
PCLM4 
PCNT2 
PCOC1 
PFDC1 
PFXC1 
PGBP7 
PHBP1 
PILA2 
PILL1 
PILM4 
PKYF1 
PLSF1 
PLSFA 
PLSP4 
PLXA2 
PMAF1 
PMNT2 
PMOA2 
PNGW3 
PNLM4 
PNLM6 
PORO3 
PORT2 
POTA2 
PPTA1 
PPTM2 
PPXC1 
PRDA2 
PRIM4 
PRJC1 
PRTA2 
PRUR1 
PRYC1 
PSBC1 
PSBM1 
PSCM4 
PSLC1 
PSTL1 
PSTN6 
PSXC1 
PTAC1 
PTAT2 
PTAW1 
PTBM6 
PTCR1 
PTGC1 
PTIM4 
PTIT2 
PTJN6 
PTLA2 
PTOA1 
PTRF1 
PTRP4 
PTWW1 
PVDR1 
PVGF1 
PWAW3 
PXAC1 
PXOC1 
PXSC1 
QPTR1 
RARM6 
RCKM4 
RCMC1 
RCPT2 
RCRN6 
RCYF1 
RDDA2 
RDYD1 
RLIT2 
RLOT2 
ROAM4 
ROBN4 
RPLV2 
RPRN6 
RSJT2 
RTAT2 
RTOT2 
RTYC1 
SACV4 
SANF1 
SAPF1 
SAUF1 
SBBN2 
SBEO3 
SBIO1 
SBLF1 
SBLM4 
SBPT2 
SCIS1 
SCSN6 
SDBC1 
SDHN4 
SDIA2 
SDRT2 
SECG1 
SGNT2 
SGNW3 
SGOF1 
SGRN4 
SHBL1 
SHPF1 
SIPF1 
SISA2 
SISW1 
SJLF1 
SJNP4 
SJOM4 
SJSN4 
SKMG1 
SKTA2 
SLIM2 
SLMN2 
SLVM5 
SMBS1 
SMKF1 
SMOC1 
SNDA2 
SNDP5 
SNSN7 
SOSN6 
SPAG1 
SPGF1 
SPLL1 
SPTM4 
SRBV3 
SREF1 
SRLM4 
SRST2 
SSBN7 
STDM4 
SUPN6 
SVLS1 
SVNM4 
SWLA2 
SWPM4 
SWPV2 
SXHW3 
SYWW3 
TAML1 
TAQT2 
TARF1 
TAWM4 
TBIM4 
TBYF1 
TCBM2 
TCMW1 
TCNW1 
TCVF1 
TDPC1 
TESL1 
THIN6 
THLO1 
THRO1 
TIBC1 
TKEA2 
TLBO3 
TOKW1 
TPAF1 
TPBN4 
TPEF1 
TPLM2 
TRBL1 
TRDF1 
TRRF1 
TSHF1 
TTIW1 
TXPT2 
TYBG1 
ULAM6 
ULRA2 
UNLA2 
UPBC1 
VAKF1 
VBBA3 
VCAF1 
VCAT2 
VCVA2 
VDZA2 
VENF1 
VERV4 
VMSV2 
VQSP4 
WAHV2 
WAKP8 
WASD2 
WATS1 
WAVM6 
WBYA1 
WDEL1 
WDSV2 
WELM1 
WFPM4 
WHRI2 
WIWF1 
WLON7 
WNEM4 
WPLF1 
WPOW1 
WPTW1 
WRBF1 
WSLM4 
WWEF1 
WYCM6 
YABP4 
YATA2 
YGNN6 
YKRV2 
YKTV2 
"


for i in $arr; do
  SOURCE=$(curl -L http://www.ndbc.noaa.gov/station_page.php?station=${i})
  ID=$(echo "$SOURCE" | sed 's/;//' | sed "s/'//g" | grep 'var currentstnid' | awk '{print $4}')
  LAT=$(echo "$SOURCE" | sed 's/;//' | grep 'var currentstnlat' | awk '{print $4}')
  LNG=$(echo "$SOURCE" | sed 's/;//' |  grep 'var currentstnlng' | awk '{print $4}')

  echo -n $ID >> coordinates.html 
  echo -n ,$LAT >> coordinates.html
  echo ,$LNG >> coordinates.html
done
