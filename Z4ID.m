Off[General::spell]

Model`Name = "Z4ID";
Model`NameLaTeX ="Z4 Singlet doublet Model";
Model`Authors = "MJ";
Model`Date = "2021-06-09";



(* Command to get micrOmegas file with two DM candidates: *)
(* MakeCHep[DMcandidate1 -> Z4 == -1, DMcandidate2 -> Z4 == I]; *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)

Global[[1]] = {Z[4], Z4};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};


(* Matter Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};

ScalarFields[[1]] =  {H1, 1, {H1p, H10},     1/2, 2,  1, 1}; (* Higgs del SM*)
ScalarFields[[2]] =  {S, 1, s,               0, 1, 1,  Exp[2*Pi*I/4]}; (* S*)
ScalarFields[[3]] =  {H2, 1, {H2p, H20},     1/2, 2,  1, Exp[2*2*Pi*I/4]}; (* H2*)



(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)


  		  
DEFINITION[GaugeES][Additional]= {
	{LagV0, {AddHC->False}},
	{LagYuk, {AddHC->True}},
	{LagZ4, {AddHC->True}}

};

LagV0= -(Mu12 conj[H1].H1 + Lambda1 conj[H1].H1.conj[H1].H1 + Mu22 conj[H2].H2 + \
       Lambda2 conj[H2].H2.conj[H2].H2 + MuS2 conj[S].S + LambdaS S.conj[S].S.conj[S] + \
       LambdaS1 S.conj[S].conj[H1].H1 + LambdaS2 S.conj[S].conj[H2].H2 + \
       Lambda3 conj[H1].H1.conj[H2].H2 + Lambda4 conj[H1].H2.conj[H2].H1);

LagZ4= -(LambdaPriS/2 S.S.S.S + Lambda5/2 conj[H1].H2.conj[H1].H2 + \
       LambdaS12/2 S.S.conj[H1].H2 + LambdaS21/2 S.S.conj[H2].H1);

LagYuk= -(Yd conj[H1].d.q + Ye conj[H1].e.l + Yu H1.u.q);

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};    
        
        
          	

(* ----- VEVs ---- *)


DEFINITION[EWSB][VEVs]= 
{    {H10, {v, 1/Sqrt[2]}, {G0, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}},
     {H20, {0, 0}, {A0, \[ImaginaryI]/Sqrt[2]},{H0, 1/Sqrt[2]}} 
     
      };

 

(* ---- Mixings ---- *)


DEFINITION[EWSB][MatterSector]=   
    {{{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};
