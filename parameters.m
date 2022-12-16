ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum ->  Sqrt[2]/v* {{Mass[Fu,1],0,0},
             									{0, Mass[Fu,2],0},
             									{0, 0, Mass[Fu,3]}}}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fd,1],0,0},
             									{0, Mass[Fd,2],0},
             									{0, 0, Mass[Fd,3]}}}},
             									
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fe,1],0,0},
             									{0, Mass[Fe,2],0},
             									{0, 0, Mass[Fe,3]}}}},                                                                                                             
{v,          { Description -> "EW-VEV",
               DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],
               DependenceSPheno -> None  }},

{ThetaW,    { Description -> "Weinberg-Angle",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]}},

{ZZ, {Description -> "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1},
                  {\[ImaginaryI],-\[ImaginaryI]}} }},


{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},

(* Scalar sector *)						       

{Lambda1, { Description -> "SM Higgs Selfcouplings",
               DependenceNum -> Mass[hh]^2/(v^2)}},

{Lambda2,     {OutputName ->"LA2",
              LaTeX -> "\\lambda_{2}",
              LesHouches -> {HDM,2}}}, 

{Lambda3,     {OutputName ->"LA3",
              LaTeX -> "\\lambda_{3}",
              LesHouches -> {HDM,3}}}, 
              
{Lambda4,     {OutputName ->"LA4",
              LaTeX -> "\\lambda_{4}",
              LesHouches -> {HDM,4}}}, 

{Lambda5,     {OutputName ->"LA5",
              LaTeX -> "\\lambda_{5}",
              LesHouches -> {HDM,5}}}, 

{LambdaPriS,     {OutputName ->"LAPS",
             LaTeX -> "\\lambda'_{S}",
             LesHouches -> {HDM,6}}},

{LambdaS,     {OutputName ->"LAS",
              LaTeX -> "\\lambda_{S}",
              LesHouches -> {HDM,7}}}, 

{LambdaS1,     {OutputName ->"LAS1",
             LaTeX -> "\\lambda_{S1}",
             LesHouches -> {HDM,8}}},

{LambdaS2,     {OutputName ->"LAS2",
             LaTeX -> "\\lambda_{S2}",
             LesHouches -> {HDM,9}}},

{LambdaS12,    {OutputName ->"LAS12",
              LaTeX -> "\\lambda_{S12}",
              LesHouches -> {HDM,10}}},

{LambdaS21,    {OutputName ->"LAS21",
              LaTeX -> "\\lambda_{S21}",
              LesHouches -> {HDM,11}}},

{Mu12,         { Description -> "SM Mu Parameter",
                LaTeX -> "\\mu_1^2",
	        OutputName -> mu1,
	        LesHouches -> {HDM,12}}},

{Mu22,      {Description -> "Softbreaking Up-Higgs Mass",
             LaTeX -> "\\mu_{2}^2",
	     OutputName-> Mu2,
	     LesHouches -> {HDM,13}}},

{MuS2,      {Description -> "Softbreaking Up-Higgs Mass",
             LaTeX -> "\\mu_{s}^2",
	     OutputName-> MS,
	     LesHouches -> {HDM,14}}}
						       
 }; 
 
