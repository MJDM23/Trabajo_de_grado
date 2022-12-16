ParticleDefinitions[GaugeES] = {
      {H10,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H1^0",
                 OutputName -> "H10" }},                         
      
      
      {H1p,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> {"G^+","G^-"}, 
                 OutputName -> "H1p" }}, 
                 
      {H20, {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H2^0",
                 OutputName -> "H20" }},

      {H2p, {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H2p",
                 OutputName -> "H2p" }}, 
               
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}}
      
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
    {hh   ,  {  Description -> "Higgs",
                PDG -> {25},
		        PDG.IX -> {101000001},
                Mass -> LesHouches,
                FeynArtsNr -> 1,
                LaTeX -> "h",
                ElectricCharge -> 0,
                LHPC -> {1},
		        OutputName -> "h"  }}, 

     {G0   ,  {  Description -> "Pseudo-Scalar Higgs",
                 FeynArtsNr -> 2,
                 Width -> {0, External},
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0}
                 }},                       
      
      
     {H1p,     { Description -> "Charged Higgs", 
                 FeynArtsNr -> 3,
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 ElectricCharge->+1,                 
                 LaTeX -> {"G^+","G^-"},
                 OutputName -> {"H1p","H1m"}
                 }},    
                                                               
      {s  , {  Description -> "Singlet",
	       PDG -> {6666635},
	       PDG.IX -> {101000002},
               FeynArtsNr -> 10,
               Mass -> LesHouches,               
               LaTeX -> "S",
               ElectricCharge -> 0,
               LHPC -> {"gold"},
       	       OutputName -> "s" }},
     
      
      {H0,   {  Description -> "CP-even H2 scalar", 
		 PDG -> {1001},
		 Mass -> LesHouches,
		 ElectricCharge -> 0,
		 LaTeX -> "\H^0",
		 OutputName -> "H0" }}, 
		 
      {A0,   {  Description -> "CP-odd H2 scalar", 
		 PDG -> {1002},
		 Mass -> LesHouches,
		 ElectricCharge -> 0,
		 LaTeX -> "A^0",
		 OutputName -> "A0" }}, 
		 
      {H2p,   {  Description -> "Charged H2 scalar", 
		 PDG -> {1003},
		 Mass -> LesHouches,
		 ElectricCharge -> 1,
		 LaTeX -> "H2p",
         OutputName -> "H2p" }},
  
      
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> Ah }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWp,  { Description -> "W+ - Boson",
      			Goldstone -> Hp }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},
      {gZp,    { Description -> "Z'-Ghost" }},          
                               
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }}                                                              
     
        };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H1,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H1",
                 OutputName -> "" }},

    {S,     {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "S",
                 OutputName -> "" }},
    
    {H2,    {LaTeX -> "H2"}},


   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }}
        };       
