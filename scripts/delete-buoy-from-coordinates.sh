#!/bin/bash

declare -a arr="
42016
42014
42012
41018
42054
41141
42050
42011
42038
41193
42003
42037
42009
42007
42008
42001
41022
42015
41096
41140
42002
41017
42004
41021
41159
41005
41030
42010
42025
42041
41027
41006
41035
42005
42067
41194
41003
42051
42375
42394
42395
42935
44001
44004
44006
44010
44012
44015
44019
44028
44031
44035
44038
44041
44042
44043
44052
44053
44054
44055
44065
44066
44067
44068
44070
44091
44093
44094
44095
44096
44097
44098
44099
44100
44172
45001
45002
45003
45004
45005
45006
45007
45008
45010
45012
45013
45014
45015
45016
45018
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
46126
46131
46132
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
46221
46222
46223
46224
46225
46226
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
46251
46252
46253
46254
46255
46256
46257
46260
48011
48012
48114
48211
48212
48213
48214
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
42OTP
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
"

for buoy in $arr; do
  psql -h localhost -p 5439 -U buoydbuser -d buoydb -c "
  DELETE FROM coordinates WHERE buoyid='$buoy'"
done