;--------------------------------------
; I of IV by Pauline Oliveros - 1996
; written by Parham Izadyar   - 2025 
; (Csound 7-alpha - CsoundQt 7-alpha)
; Under the guidance of Joachim Heintz
;This project is licensed under the [CC BY-NC 4.0]
;--------------------------------------
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 64
nchnls = 2
0dbfs = 1


seed 0 


;;widgets
indx = 0
while indx < 11 do
  SOSC    =   sprintf("osc%d", indx+1)
  SFrq    =   sprintf("frq%d", indx+1)
  SAmp    =   sprintf("amp%d", indx+1)
  chn_k(SOSC, 1)
  chn_k(SFrq, 2)
  chn_k(SAmp, 2)
  indx += 1
od
chn_k("lcsr",       1)
chn_k("showgliss",  2)
chn_k("showlfo",    2)
chn_k("gendata",    1)
chn_k("dconoff",    1)
chn_k("lfo",        1)
chn_k("rtime",      1)
chn_k("rdiff",      1)
chn_k("rmix",       1)
chn_k("tmix",       1)
chn_k("rpulse",     1)
chn_k("rnoise",     1)
chn_k("sigclear",   1)
chn_k("chnmod",     1)
chn_k("tamp1",      1)
chn_k("tamp2",      1)
chn_k("tamp3",      1)
chn_k("tamp4",      1)
chn_k("tamp5",      1)
chn_k("outamp1",    1)
chn_k("outamp2",    1)
chn_k("outamp3",    1)
chn_k("outamp4",    1)
chn_k("outamp5",    1)
chn_k("meter1",     2)
chn_k("meter2",     2)
chn_k("meter3",     2)
chn_k("meter4",     2)


;;UDOs
opcode overSampOsc, a,0
  iLocalSr = chnget("lcsr")
  oversample(iLocalSr+1) ;sets high local oversampling
  ;;generates random Freqs / Amps
  iFrqMin = 30000
  iFrqMax = 60000
  iAmpMin = 0.1
  iAmpMax = 0.5
  kGenerate = chnget("gendata")
  if kGenerate == 1 && changed(kGenerate) == 1 then
		kRndAmp1  =  random(iAmpMin, iAmpMax)
		kRndAmp2  =  random(iAmpMin, iAmpMax)
		kRndAmp3  =  random(iAmpMin, iAmpMax)
		kRndAmp4  =  random(iAmpMin, iAmpMax)
		kRndAmp5  =  random(iAmpMin, iAmpMax)
		kRndAmp6  =  random(iAmpMin, iAmpMax)
		kRndAmp7  =  random(iAmpMin, iAmpMax)
		kRndAmp8  =  random(iAmpMin, iAmpMax)
		kRndAmp9  =  random(iAmpMin, iAmpMax)
		kRndAmp10 =  random(iAmpMin, iAmpMax)
		kRndAmp11 =  random(iAmpMin, iAmpMax)
		kRndFrq1  =  random(iFrqMin, iFrqMax)
		kRndFrq2  =  random(iFrqMin, iFrqMax)
		kRndFrq3  =  random(iFrqMin, iFrqMax)
		kRndFrq4  =  random(iFrqMin, iFrqMax)
		kRndFrq5  =  random(iFrqMin, iFrqMax)
		kRndFrq6  =  random(iFrqMin, iFrqMax)
		kRndFrq7  =  random(iFrqMin, iFrqMax)
		kRndFrq8  =  random(iFrqMin, iFrqMax)
		kRndFrq9  =  random(iFrqMin, iFrqMax)
		kRndFrq10 =  random(iFrqMin, iFrqMax)
		kRndFrq11 =  random(iFrqMin, iFrqMax)
		kGlissRnd =  random(0, 0.6)
  endif
  ;;add gliss for frq/amp changes
  chnset(kGlissRnd , "showgliss")
  kGliss = kGlissRnd/2
  ;;on / off OSCs
  kAmpOnOff1  =  chnget("osc1")
  kAmpOnOff2  =  chnget("osc2")
  kAmpOnOff3  =  chnget("osc3")
  kAmpOnOff4  =  chnget("osc4")
  kAmpOnOff5  =  chnget("osc5")
  kAmpOnOff6  =  chnget("osc6")
  kAmpOnOff7  =  chnget("osc7")
  kAmpOnOff8  =  chnget("osc8")
  kAmpOnOff9  =  chnget("osc9")
  kAmpOnOff10 =  chnget("osc10")
  kAmpOnOff11 =  chnget("osc11")
  ;;show data on GUI
  chnset(kRndAmp1,  "amp1")
  chnset(kRndAmp2,  "amp2")
  chnset(kRndAmp3,  "amp3")
  chnset(kRndAmp4,  "amp4")
  chnset(kRndAmp5,  "amp5")
  chnset(kRndAmp6,  "amp6")
  chnset(kRndAmp7,  "amp7")
  chnset(kRndAmp8,  "amp8")
  chnset(kRndAmp9,  "amp9")
  chnset(kRndAmp10, "amp10")
  chnset(kRndAmp11, "amp11")
  chnset(kRndFrq1,  "frq1")
  chnset(kRndFrq2,  "frq2")
  chnset(kRndFrq3,  "frq3")
  chnset(kRndFrq4,  "frq4")
  chnset(kRndFrq5,  "frq5")
  chnset(kRndFrq6,  "frq6")
  chnset(kRndFrq7,  "frq7")
  chnset(kRndFrq8,  "frq8")
  chnset(kRndFrq9,  "frq9")
  chnset(kRndFrq10, "frq10")
  chnset(kRndFrq11, "frq11")
  ;;DC offset to prevent level loss through multiplication
  kDCosc = chnget("dconoff")
  kDCfrq = chnget("lfo")
  chnset(kDCfrq, "showlfo")
  if kDCosc == 0 then
    aDC = a(0.5)
  elseif kDCosc == 1 then
    aDC = lfo(0.5, kDCfrq, 2)
  endif
  ;;oscillators
  aOSC1  = vco2:a((portk(kRndAmp1,kGliss))*kAmpOnOff1,   portk(kRndFrq1,kGliss),   2, 0.5)+aDC
  aOSC2  = vco2:a((portk(kRndAmp2,kGliss))*kAmpOnOff2,   portk(kRndFrq2,kGliss),   2, 0.5)+aDC
  aOSC3  = vco2:a((portk(kRndAmp3,kGliss))*kAmpOnOff3,   portk(kRndFrq3,kGliss),   2, 0.5)+aDC
  aOSC4  = vco2:a((portk(kRndAmp4,kGliss))*kAmpOnOff4,   portk(kRndFrq4,kGliss),   2, 0.5)+aDC
  aOSC5  = vco2:a((portk(kRndAmp5,kGliss))*kAmpOnOff5,   portk(kRndFrq5,kGliss),   2, 0.5)+aDC
  aOSC6  = vco2:a((portk(kRndAmp6,kGliss))*kAmpOnOff6,   portk(kRndFrq6,kGliss),   2, 0.5)+aDC
  aOSC7  = vco2:a((portk(kRndAmp7,kGliss))*kAmpOnOff7,   portk(kRndFrq7,kGliss),   2, 0.5)+aDC
  aOSC8  = vco2:a((portk(kRndAmp8,kGliss))*kAmpOnOff8,   portk(kRndFrq8,kGliss),   2, 0.5)+aDC
  aOSC9  = vco2:a((portk(kRndAmp9,kGliss))*kAmpOnOff9,   portk(kRndFrq9,kGliss),   2, 0.5)+aDC
  aOSC10 = vco2:a((portk(kRndAmp10,kGliss))*kAmpOnOff10, portk(kRndFrq10,kGliss),  2, 0.5)+aDC
  aOSC11 = vco2:a((portk(kRndAmp11,kGliss))*kAmpOnOff11, portk(kRndFrq11,kGliss),  2, 0.5)+aDC
  ;;amplitude modulation of signals
  aOut = aOSC1*aOSC2*aOSC3*aOSC4*aOSC5*aOSC6*aOSC7*aOSC8*aOSC9*aOSC10*aOSC11
  xout aOut
endop

opcode lohiFilti, a, aii ;lowPass and HighPass Filters
  aIn, iLowCut, iHighCut xin
  aHighCut = clfilt(aIn, iHighCut, 0, 10)
  aOut     = clfilt(aHighCut, iLowCut, 1, 10)
  xout aOut
endop



instr tapeMachine
;widgets
  kRvrbTimeIn   =  chnget("rtime")
  kRvrbDiffIn   =  chnget("rdiff")
  kRvrbMixIn    =  chnget("rmix")
  kPulse        =  chnget("rpulse")
  kNoise        =  chnget("rnoise")
  kOutMix       =  chnget("tmix")
  kClearSig     =  chnget("sigclear")
  kChnSet       =  chnget("chnmod")
  kAmp1 = ampdb:k(chnget:k("tamp1")) 
  kAmp2 = ampdb:k(chnget:k("tamp2"))
  kAmp3 = ampdb:k(chnget:k("tamp3")) 
  kAmp4 = ampdb:k(chnget:k("tamp4")) 
  kAmp5 = ampdb:k(chnget:k("tamp5")) 
  kOut1 = ampdb:k(chnget:k("outamp1")) 
  kOut2 = ampdb:k(chnget:k("outamp2"))
  kOut3 = ampdb:k(chnget:k("outamp3")) 
  kOut4 = ampdb:k(chnget:k("outamp4")) 
  kOutMaster = ampdb:k(chnget:k("outamp5")) 
  ;inputs
  aInput  = overSampOsc
;;DC offset block
  kAmp1   = port(kAmp1, 0.1)
  aInDC   = dcblock2(aInput*kAmp1)
;;add filter on input signal
  aInFilt = lohiFilti(aInDC, 400, 12000)
;;reverb
  kRvrbTime  = port(kRvrbTimeIn, 0.1)
  kRvrbDiff  = port(kRvrbDiffIn, 0.1)
  kRvrbMix   = port(kRvrbMixIn,  0.1)
  if kPulse == 1 then	;sends a short pulse to the reverb
    kPulseFrq  = rspline(1, 10, 7, 15)
    aPulse     = vco2(0.1, kPulseFrq , 0, 0.2)
    aPulse     = lohiFilti(aPulse, 300, 12000)
  elseif kPulse == 0 then
    aPulse = 0
  endif
   aFb init 0
  if kNoise == 1 then	;sends a short pulse to the reverb
    aNoise = noise(30, 0.5)
    aNoise = (aNoise*10)+aFb
    aSine  = poscil(1, aNoise)
    aPhas  = phasor(aNoise)
    aSum   = sum(aSine, aPhas)
    aFb    = delay(aSum, 0.2)
  elseif kNoise == 0 then
    aFb = 0
  endif
  clearSignal: 
  a1stRvrb           =  nreverb(aInFilt, kRvrbTime, kRvrbDiff)
  aFrRvrbMix         =  ntrpol(aInFilt, a1stRvrb+(aFb*0.2)+aPulse, kRvrbMix)
  a2ndRvrb,a2ndRvrb  reverbsc aFrRvrbMix, aFrRvrbMix, kRvrbDiff, 18000
  aRvrbMix           =  ntrpol(aFrRvrbMix+(aFb*0.2)+aPulse, a2ndRvrb, kRvrbMix)
;;tape feedback
  aRec1B init 0
  aRec2A init 0
  aRec2B init 0
  aRec1A = delay(aRvrbMix+(aRec1B*kAmp2)+(aRec2A*kAmp3), 0.1)
  aRec1B = delay((aRec1A*kAmp4)+(aRec2B*kAmp5), 0.07)
  aRec2A = delay(aRec1A, 7.7)
  aRec2B = delay(aRec1B, 7.7)
;;output filter
  aFilt1 = lohiFilti(aRec1A,  50, 18000)
  aFilt2 = lohiFilti(aRec1B,  50, 18000)
  aFilt3 = lohiFilti(aRec2A,  50, 18000)
  aFilt4 = lohiFilti(aRec2B,  50, 18000)
;;clear audio
  if changed(kClearSig) == 1 then
    reinit(clearSignal)
  endif 
;;outputs
;clips to avoid distrotion
  kStartEnv = transeg(0, 1, 6, 1)
  aOut1     = clip(aFilt1*kOut1*kStartEnv, 2, 0.9)
  aOut2     = clip(aFilt2*kOut2*kStartEnv, 2, 0.9)
  aOut3     = clip(aFilt3*kOut3*kStartEnv, 2, 0.9)
  aOut4     = clip(aFilt4*kOut4*kStartEnv, 2, 0.9)
  aOutMix1  = ntrpol(aInFilt, aOut1, kOutMix)*kOutMaster
  aOutMix2  = ntrpol(aInFilt, aOut2, kOutMix)*kOutMaster
  aOutMix3  = ntrpol(aInFilt, aOut3, kOutMix)*kOutMaster
  aOutMix4  = ntrpol(aInFilt, aOut4, kOutMix)*kOutMaster
;;show meters on GUI
  kMeter1   = max_k(aOutMix1, metro(20), 1)
  kMeter2   = max_k(aOutMix2, metro(20), 1)
  kMeter3   = max_k(aOutMix3, metro(20), 1)
  kMeter4   = max_k(aOutMix4, metro(20), 1)
  chnset(kMeter1, "meter1")
  chnset(kMeter2, "meter2")
  chnset(kMeter3, "meter3")
  chnset(kMeter4, "meter4")
;;select Channels
  if kChnSet == 0 then       ;mono
    outch(1, (aOutMix1+aOutMix2)/2)
  elseif kChnSet == 1 then   ;stereo
    out(aOutMix1, aOutMix2)
  elseif kChnSet == 2 then   ;quadrophonic
    outs(aOutMix1, aOutMix2, aOutMix3, aOutMix4)
  endif
endin



</CsInstruments>
<CsScore>
i "tapeMachine" 1 99999
</CsScore>
</CsoundSynthesizer>



















































<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>354</x>
 <y>375</y>
 <width>1126</width>
 <height>718</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>203</r>
  <g>199</g>
  <b>185</b>
 </bgcolor>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>65</x>
  <y>15</y>
  <width>105</width>
  <height>51</height>
  <uuid>{8759c15f-a28a-4436-a7de-c5eb69c685e2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>I of IV</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>35</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>165</x>
  <y>25</y>
  <width>200</width>
  <height>35</height>
  <uuid>{0d9392d0-17ca-4d18-988f-b0fa6261e190}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>by Pauline Oliveros</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Liberation Sans</font>
  <fontsize>20</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>370</x>
  <y>65</y>
  <width>419</width>
  <height>94</height>
  <uuid>{62601eab-a8ab-4590-b4ef-5530e8b7f19e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>169</r>
   <g>185</g>
   <b>191</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>dconoff</objectName>
  <x>390</x>
  <y>110</y>
  <width>145</width>
  <height>35</height>
  <uuid>{c4664ee9-cc7c-44ff-8008-bc70bee67ee4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>DC osc: on/Off</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>370</x>
  <y>195</y>
  <width>716</width>
  <height>244</height>
  <uuid>{c367b88e-6425-449d-8548-fc5580e5fd3e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>169</r>
   <g>185</g>
   <b>191</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp1</objectName>
  <x>410</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{24b9a1ba-cb63-45c2-ac86-730d84e7bf29}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>60.00000000</maximum>
  <value>35.57251908</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp2</objectName>
  <x>480</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{d4cf3e8c-6bd5-45ec-8447-2ed7ce6b4ea9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-4.27480916</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp3</objectName>
  <x>525</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{b37e1ccf-264d-4d91-8ca6-f4a040d310cf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-3.08396947</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp4</objectName>
  <x>600</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{e6e44b51-82ef-4e74-9e18-5e46c6ed049c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-5.06870229</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp5</objectName>
  <x>645</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{6cec007c-e5a5-4b5b-8935-dcc6ecedf1c9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-1.89312977</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>sigclear</objectName>
  <x>515</x>
  <y>210</y>
  <width>154</width>
  <height>36</height>
  <uuid>{4a011e6d-cb2a-4585-b5b1-0da149d56612}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Clear tape Feedback</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>385</x>
  <y>395</y>
  <width>78</width>
  <height>24</height>
  <uuid>{96b82d7f-4876-41d8-9a4d-0b898f9d68e1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>input signal</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>470</x>
  <y>395</y>
  <width>97</width>
  <height>41</height>
  <uuid>{c51f3f03-ed9d-4be6-8a50-050619487c27}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rec1B - Rec2A
0.1 sec delay</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>590</x>
  <y>395</y>
  <width>95</width>
  <height>42</height>
  <uuid>{bbcbf5c0-541c-4fbd-9bee-6f1c2dec1e4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rec1A - Rec2B
7.7 sec delay</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>375</x>
  <y>215</y>
  <width>56</width>
  <height>30</height>
  <uuid>{390dd754-f256-4e16-80b0-9c462f4398e3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Tape</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>45</x>
  <y>65</y>
  <width>313</width>
  <height>560</height>
  <uuid>{f5564aae-da51-42ca-9179-653e9f6dc457}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>169</r>
   <g>185</g>
   <b>191</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc1</objectName>
  <x>55</x>
  <y>230</y>
  <width>40</width>
  <height>30</height>
  <uuid>{40af4895-cdeb-4f56-a733-a156e9b96a96}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc1</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq1</objectName>
  <x>105</x>
  <y>230</y>
  <width>94</width>
  <height>29</height>
  <uuid>{e870ad90-38c0-48b9-a96c-c05be735c4db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc2</objectName>
  <x>55</x>
  <y>265</y>
  <width>40</width>
  <height>30</height>
  <uuid>{c03e8efa-319e-4a26-9876-510851e82498}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc2</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq2</objectName>
  <x>105</x>
  <y>265</y>
  <width>94</width>
  <height>29</height>
  <uuid>{5d37af77-811c-40f6-af24-f06fbb7629f7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc3</objectName>
  <x>55</x>
  <y>300</y>
  <width>40</width>
  <height>30</height>
  <uuid>{1a62eee8-2efc-4295-a8c8-2ed65914259a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc3</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq3</objectName>
  <x>105</x>
  <y>300</y>
  <width>94</width>
  <height>29</height>
  <uuid>{8250c871-ac4c-4ed8-9f56-845499bc532b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc4</objectName>
  <x>55</x>
  <y>335</y>
  <width>40</width>
  <height>30</height>
  <uuid>{ca8be606-c53c-4b39-ac4b-144c25fd6c22}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc4</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq4</objectName>
  <x>105</x>
  <y>335</y>
  <width>94</width>
  <height>29</height>
  <uuid>{112f2bb8-3e93-471e-9446-e9e1919350c0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc5</objectName>
  <x>55</x>
  <y>370</y>
  <width>40</width>
  <height>30</height>
  <uuid>{c6914375-99cf-4d1b-93e1-a3cc371ec6eb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc5</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq5</objectName>
  <x>105</x>
  <y>370</y>
  <width>94</width>
  <height>29</height>
  <uuid>{b3c13578-4012-4d62-a2e6-68dc60470646}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc6</objectName>
  <x>55</x>
  <y>405</y>
  <width>40</width>
  <height>30</height>
  <uuid>{215777db-1df3-4b98-b814-2ff9218101ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc6</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq6</objectName>
  <x>105</x>
  <y>405</y>
  <width>94</width>
  <height>29</height>
  <uuid>{228b3ba4-6d35-4bbd-8f98-301b3bb3c72a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc7</objectName>
  <x>55</x>
  <y>440</y>
  <width>40</width>
  <height>30</height>
  <uuid>{c58b139d-cccc-4a1c-873d-87dfda7839ee}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc7</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq7</objectName>
  <x>105</x>
  <y>440</y>
  <width>94</width>
  <height>29</height>
  <uuid>{98fde23e-6805-484d-a63c-ae92afc15ef9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc8</objectName>
  <x>55</x>
  <y>475</y>
  <width>40</width>
  <height>30</height>
  <uuid>{af843fed-f93e-4b15-9096-4445da9d0318}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc8</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq8</objectName>
  <x>105</x>
  <y>475</y>
  <width>94</width>
  <height>29</height>
  <uuid>{66c83f26-9dbc-4ece-bed1-2e362b454388}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc9</objectName>
  <x>55</x>
  <y>510</y>
  <width>40</width>
  <height>30</height>
  <uuid>{7f54cf17-a243-408f-b672-ef87a82974fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc9</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq9</objectName>
  <x>105</x>
  <y>510</y>
  <width>94</width>
  <height>29</height>
  <uuid>{571a2bde-9059-4374-9dbf-96ff91ecead5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc10</objectName>
  <x>55</x>
  <y>545</y>
  <width>40</width>
  <height>30</height>
  <uuid>{ba748f72-16dc-437f-95d3-842a35c134df}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc10</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq10</objectName>
  <x>105</x>
  <y>545</y>
  <width>94</width>
  <height>29</height>
  <uuid>{639d1dbc-b3ed-4442-8be9-610a61ba8792}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc11</objectName>
  <x>55</x>
  <y>580</y>
  <width>40</width>
  <height>30</height>
  <uuid>{c437e209-39b4-4bf3-a1f8-5957c9b71d86}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc11</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq11</objectName>
  <x>105</x>
  <y>580</y>
  <width>94</width>
  <height>29</height>
  <uuid>{25c06902-a08d-4bb9-8b3e-5546f056dc50}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.00</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>230</y>
  <width>30</width>
  <height>29</height>
  <uuid>{9a0bff48-6fd3-46a9-af79-0d9d7293dfc5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>265</y>
  <width>30</width>
  <height>29</height>
  <uuid>{d2ff2f44-3a0a-4148-adb3-a4e8b04dece0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>300</y>
  <width>30</width>
  <height>29</height>
  <uuid>{90507ab7-85a1-4588-b664-2702cf15db83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>335</y>
  <width>30</width>
  <height>29</height>
  <uuid>{5b765ed2-8c62-412c-9f93-8c22e32d8b51}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>370</y>
  <width>30</width>
  <height>29</height>
  <uuid>{647972ee-f53a-4f24-a07e-65151738f622}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>405</y>
  <width>30</width>
  <height>29</height>
  <uuid>{a568cdf7-4046-4d19-a90a-35fae203d390}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>440</y>
  <width>30</width>
  <height>29</height>
  <uuid>{26eac5b5-48cd-4734-9d7f-f557e0a00691}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>475</y>
  <width>30</width>
  <height>29</height>
  <uuid>{cd53e0b3-e77a-4b31-aeb2-f275d782933c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>510</y>
  <width>30</width>
  <height>29</height>
  <uuid>{beb15b61-af17-44bf-a8de-97b91d89d948}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>545</y>
  <width>30</width>
  <height>29</height>
  <uuid>{f0ff5183-f9cb-4aa7-9063-fe59f28d8973}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>580</y>
  <width>30</width>
  <height>29</height>
  <uuid>{07d21318-5751-4f60-82cd-6e0ec8ad24c3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>gendata</objectName>
  <x>55</x>
  <y>135</y>
  <width>204</width>
  <height>43</height>
  <uuid>{65ed68b4-a536-4fe8-8752-1dcba23206a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>generate random Freqs / Amps</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp1</objectName>
  <x>235</x>
  <y>230</y>
  <width>60</width>
  <height>29</height>
  <uuid>{01aa02ce-ad3d-4859-9fdd-3ecb3a8b99ed}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>230</y>
  <width>50</width>
  <height>29</height>
  <uuid>{f8b1dc2b-0feb-4e35-bb5b-74c126017d41}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp2</objectName>
  <x>235</x>
  <y>265</y>
  <width>60</width>
  <height>29</height>
  <uuid>{9384dc59-4079-42bd-aaef-f056e529be7f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>265</y>
  <width>50</width>
  <height>29</height>
  <uuid>{26b44fcc-40c1-4c9a-931e-20c697eab196}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp3</objectName>
  <x>235</x>
  <y>300</y>
  <width>60</width>
  <height>29</height>
  <uuid>{da996c72-3973-4070-94cf-e4a8cac0e138}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>300</y>
  <width>50</width>
  <height>29</height>
  <uuid>{cd59a0b5-b64f-41b4-8f2b-332e088ef5d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp4</objectName>
  <x>235</x>
  <y>335</y>
  <width>60</width>
  <height>29</height>
  <uuid>{5c86cec3-7a47-474d-9f59-e5d1108648fd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>335</y>
  <width>50</width>
  <height>29</height>
  <uuid>{5c3c7476-efa3-4db7-b8ae-4c0ac1058cc5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp5</objectName>
  <x>235</x>
  <y>370</y>
  <width>60</width>
  <height>29</height>
  <uuid>{f51aa24b-e4d8-455e-b064-1276d514b061}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>370</y>
  <width>50</width>
  <height>29</height>
  <uuid>{48f38195-49dc-402a-86d0-d589d2017402}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp6</objectName>
  <x>235</x>
  <y>405</y>
  <width>60</width>
  <height>29</height>
  <uuid>{6268a547-f365-4bd6-9f2e-069f2d66a278}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>405</y>
  <width>50</width>
  <height>29</height>
  <uuid>{67d26236-b4b5-4741-8cd8-d1738ac2484f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp7</objectName>
  <x>235</x>
  <y>440</y>
  <width>60</width>
  <height>29</height>
  <uuid>{4bed5bc4-a57f-46cd-a0da-37d83d92f0ba}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>440</y>
  <width>50</width>
  <height>29</height>
  <uuid>{5da8d131-11bb-48bf-ad4a-285ba4d3a19a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp8</objectName>
  <x>235</x>
  <y>475</y>
  <width>60</width>
  <height>29</height>
  <uuid>{076b35be-1d27-42f5-8d3d-cf9feccd14dd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>475</y>
  <width>50</width>
  <height>29</height>
  <uuid>{3b002b2f-60ef-4e54-a497-b8b2a611ea72}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp9</objectName>
  <x>235</x>
  <y>510</y>
  <width>60</width>
  <height>29</height>
  <uuid>{7ca12812-a265-44ad-b21a-7f668199e2c0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>510</y>
  <width>50</width>
  <height>29</height>
  <uuid>{5ccb3e92-c512-42ba-8404-fa9dc15d6282}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp10</objectName>
  <x>235</x>
  <y>545</y>
  <width>60</width>
  <height>29</height>
  <uuid>{f38de8cb-a9f6-46d4-97a7-767bc16cd5e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>545</y>
  <width>50</width>
  <height>29</height>
  <uuid>{5b4a6b28-f37b-4aa0-a16a-b2cda3782d08}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp11</objectName>
  <x>235</x>
  <y>580</y>
  <width>60</width>
  <height>29</height>
  <uuid>{9e66a59a-38ce-4495-81dd-28b917263597}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>580</y>
  <width>50</width>
  <height>29</height>
  <uuid>{f77c2666-106c-4322-ab29-bf5688032f54}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>370</x>
  <y>470</y>
  <width>715</width>
  <height>154</height>
  <uuid>{dd883719-d8e2-4ce4-adbd-cf9c34849761}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>169</r>
   <g>185</g>
   <b>191</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>680</x>
  <y>495</y>
  <width>231</width>
  <height>110</height>
  <uuid>{114947ec-d20d-4726-bd41-14eb8dbf9cff}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
  <triggermode>NoTrigger</triggermode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>meter1</objectName>
  <x>925</x>
  <y>490</y>
  <width>25</width>
  <height>120</height>
  <uuid>{8b9e85e9-74ab-4266-9c92-2302717378f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00771136</xValue>
  <yValue>0.00771136</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>meter2</objectName>
  <x>960</x>
  <y>490</y>
  <width>25</width>
  <height>120</height>
  <uuid>{1f96550a-0c50-41e3-867f-84602c0d3f81}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter2</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00363654</xValue>
  <yValue>0.00363654</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>meter3</objectName>
  <x>995</x>
  <y>490</y>
  <width>25</width>
  <height>120</height>
  <uuid>{510eef34-264e-4af9-b41f-56e0ade644ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter3</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00677921</xValue>
  <yValue>0.00677921</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>meter4</objectName>
  <x>1030</x>
  <y>490</y>
  <width>25</width>
  <height>120</height>
  <uuid>{dcd1c848-3645-410e-8cd1-b1a6025f0ece}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter4</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00319013</xValue>
  <yValue>0.00319013</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp1</objectName>
  <x>485</x>
  <y>485</y>
  <width>25</width>
  <height>110</height>
  <uuid>{ba4190f8-65b8-4a78-915d-98d83ffbfd9a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-0.29090909</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp2</objectName>
  <x>515</x>
  <y>485</y>
  <width>25</width>
  <height>110</height>
  <uuid>{39c92c71-f70b-4154-bb8b-7c5f1b3642ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-1.23636364</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp3</objectName>
  <x>545</x>
  <y>485</y>
  <width>25</width>
  <height>110</height>
  <uuid>{73e6df94-24d9-44ae-8acc-866697712857}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>0.65454545</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp4</objectName>
  <x>575</x>
  <y>485</y>
  <width>25</width>
  <height>110</height>
  <uuid>{58487319-c865-47ce-8487-07d30071fbb1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-0.76363636</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>375</x>
  <y>475</y>
  <width>65</width>
  <height>31</height>
  <uuid>{5860bcf7-7986-47e1-90c7-ee339fc4da0e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>output</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Play</objectName>
  <x>925</x>
  <y>25</y>
  <width>161</width>
  <height>51</height>
  <uuid>{f170cbde-9b02-4f0f-947e-9501d5225d3a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>S T A R T</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>15</fontsize>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>380</x>
  <y>75</y>
  <width>47</width>
  <height>29</height>
  <uuid>{ea213e68-48b8-45ff-81ee-af2dea09cb59}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>LFO</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>430</x>
  <y>80</y>
  <width>170</width>
  <height>27</height>
  <uuid>{ee4e4f02-9bd7-4092-a553-dd1c929b548b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>(12th osc =  0.1 - 1 Hz )</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>chnmod</objectName>
  <x>375</x>
  <y>585</y>
  <width>84</width>
  <height>30</height>
  <uuid>{86c97cea-a28f-466c-a748-c9f7d2a252bc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name> mono</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> 2 channels</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> 4 channels</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>lfo</objectName>
  <x>595</x>
  <y>110</y>
  <width>174</width>
  <height>31</height>
  <uuid>{dc1dfcef-e9c8-4101-9f2e-86ead7de6f00}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.10000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.23965517</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>showlfo</objectName>
  <x>675</x>
  <y>80</y>
  <width>61</width>
  <height>29</height>
  <uuid>{6cd747d3-4f4d-4b7e-ad52-1e835fafd86b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.240</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>735</x>
  <y>85</y>
  <width>28</width>
  <height>25</height>
  <uuid>{8583cfb5-8f55-46d5-b454-184844ea6892}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>rpulse</objectName>
  <x>890</x>
  <y>260</y>
  <width>93</width>
  <height>32</height>
  <uuid>{25c280fa-f400-4edd-a0c2-e6ff3f286a24}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Pulse</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>273</x>
  <y>119</y>
  <width>67</width>
  <height>28</height>
  <uuid>{b94ff3bd-6f6c-4ef2-9e80-0668e570eb6b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>gliss time</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>13</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>53</x>
  <y>102</y>
  <width>215</width>
  <height>28</height>
  <uuid>{07a57072-227f-4fcf-bd3a-fc5b9e2cb06b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq: 30 khz - 60 khz  |  Amp: 0.1 - 0.5</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>showgliss</objectName>
  <x>275</x>
  <y>147</y>
  <width>61</width>
  <height>29</height>
  <uuid>{02074d67-5c3b-4b70-90b4-0cabef2eef15}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>51</x>
  <y>73</y>
  <width>103</width>
  <height>29</height>
  <uuid>{7494f0e2-3eb7-4722-b2f3-7f5b89d2ee42}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq / Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>820</x>
  <y>625</y>
  <width>271</width>
  <height>29</height>
  <uuid>{9bce112c-8a57-4349-8529-335a382fa45d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>adapted to Csound by Parham Izadyar</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>MS Shell Dlg 2</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>rnoise</objectName>
  <x>890</x>
  <y>295</y>
  <width>93</width>
  <height>32</height>
  <uuid>{f953ed09-9cf7-46df-8e00-250f551a25f1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Noise</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tmix</objectName>
  <x>1030</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{5198af61-6bb4-499d-8219-1f39c93932d4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1015</x>
  <y>395</y>
  <width>61</width>
  <height>25</height>
  <uuid>{6f803ea2-6a15-4ec9-bdeb-4f1a8bcc3d4c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>tape mix</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rtime</objectName>
  <x>755</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{568143cb-3899-4c8d-bfe0-0a34918105fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.50000000</minimum>
  <maximum>8.00000000</maximum>
  <value>5.88167939</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rdiff</objectName>
  <x>800</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{bf7d3f03-c6b7-4a2c-af56-01f93da5cd59}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.10000000</minimum>
  <maximum>0.95000000</maximum>
  <value>0.69694656</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>750</x>
  <y>395</y>
  <width>127</width>
  <height>26</height>
  <uuid>{d51abeb2-7c7f-4bb3-91f1-9a96224a190d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>time   -   Size   -   mix</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rmix</objectName>
  <x>845</x>
  <y>260</y>
  <width>26</width>
  <height>131</height>
  <uuid>{68ee0ee2-7bc3-4c35-87f7-098372325bb9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.69465649</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>765</x>
  <y>225</y>
  <width>104</width>
  <height>26</height>
  <uuid>{c699a790-1a0e-4dfa-85f8-ac76adb0d50a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>--- Reverb ---</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>lcsr</objectName>
  <x>1010</x>
  <y>92</y>
  <width>75</width>
  <height>31</height>
  <uuid>{18f15468-0ced-41a0-8b9c-56dc585fc5fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name> x1 sr</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> x2 sr</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> x3 sr</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> x4 sr</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>3</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>796</x>
  <y>80</y>
  <width>198</width>
  <height>82</height>
  <uuid>{a7e0d092-3776-445a-ac2f-af75547aaff4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>first choose local sr then press start, high local oversampling is requared to avoid aliasing</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>480</x>
  <y>595</y>
  <width>182</width>
  <height>25</height>
  <uuid>{bba16896-c79a-4a8a-b71a-f7dd46a5d85e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>ch1 - ch2 - ch3 - ch4  -  master</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp5</objectName>
  <x>615</x>
  <y>485</y>
  <width>25</width>
  <height>110</height>
  <uuid>{87a71839-9ae2-4629-95f3-b810737fc2ca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-0.76363636</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>55</x>
  <y>190</y>
  <width>196</width>
  <height>40</height>
  <uuid>{40913e9e-1c0f-48f6-b587-529aa8e9e6ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Click to switch on the oscillators (at least two oscillators).</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>168</x>
  <y>73</y>
  <width>180</width>
  <height>27</height>
  <uuid>{89530d3a-fa88-416c-81b4-6845030f950a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Generate random frequencies</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
