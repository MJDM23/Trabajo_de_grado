OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN},
        {2,Lambda2IN},
        {3,Lambda3IN},
        {4,Lambda4IN},
        {5,Lambda5IN},
        {11, LambdaS1IN},
        {12, LambdaS2IN},
        {13, LambdaS12IN},
        {14, LambdaS21IN},
        {15, LambdaPriSIN},
        {16, LambdaSIN},
        {21, Mu22IN},
        {22, MuS2IN}
        };




ParametersToSolveTadpoles = {Mu12};

DEFINITION[MatchingConditions]= {
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {v, vSM}
 };

BoundaryLowScaleInput={
  {Lambda1,Lambda1IN},
  {Lambda2,Lambda2IN},
  {Lambda3,Lambda3IN},
  {Lambda4,Lambda4IN},
  {Lambda5,Lambda5IN},
  {LambdaPriS,LambdaPriSIN},
  {LambdaS,LambdaSIN},
  {LambdaS1,LambdaS1IN},
  {LambdaS2,LambdaS2IN},
  {LambdaS12,LambdaS12IN},
  {LambdaS21,LambdaS21IN},
  {MuS2,MuS2IN},
  {Mu22, Mu22IN}
};

AddTreeLevelUnitarityLimits=True;


ListDecayParticles = Automatic; (*{Fu,Fe,Fd,hh,s,A0,H0};*)
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;  

DefaultInputValues ={Lambda1IN -> 0.28, LambdaS1IN -> 0.1, LambdaS2IN -> 0.1, LambdaS12IN -> 0.1, LambdaS21IN -> 0.1, LambdaPSIN -> 0.1, LambdaSIN -> 0.1, Mu22IN->200,MuS2IN->200};

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
