within ThreePhase.Branches.Transformer;
package TransfConnection

  function Yg_Yg
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;
  protected
    parameter Real Gser = (1/tap)*(R/(R*R+X*X));
    parameter Real Bser = (1/tap)*(-X/(R*R+X*X));

    parameter Real Gshk = (1/tap)*((1/tap)-1)*(R/(R*R+X*X));
    parameter Real Bshk = (1/tap)*((1/tap)-1)*(-X/(R*R+X*X));

    parameter Real Gshm = (1-(1/tap))*(R/(R*R+X*X));
    parameter Real Bshm = (1-(1/tap))*(-X/(R*R+X*X));

    //Writing the Y_ser matrix according to Simulight
    parameter Real Gaaser = Gser;
    parameter Real Baaser = Bser;
    parameter Real Gabser = 0;
    parameter Real Babser = 0;
    parameter Real Gacser = 0;
    parameter Real Bacser = 0;
    parameter Real Gbaser = 0;
    parameter Real Bbaser = 0;
    parameter Real Gbbser = Gser;
    parameter Real Bbbser = Bser;
    parameter Real Gbcser = 0;
    parameter Real Bbcser = 0;
    parameter Real Gcaser = 0;
    parameter Real Bcaser = 0;
    parameter Real Gcbser = 0;
    parameter Real Bcbser = 0;
    parameter Real Gccser = Gser;
    parameter Real Bccser = Bser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = Gshk;
    parameter Real Baask = Bshk;
    parameter Real Gabsk = 0;
    parameter Real Babsk = 0;
    parameter Real Gacsk = 0;
    parameter Real Bacsk = 0;
    parameter Real Gbask = 0;
    parameter Real Bbask = 0;
    parameter Real Gbbsk = Gshk;
    parameter Real Bbbsk = Bshk;
    parameter Real Gbcsk = 0;
    parameter Real Bbcsk = 0;
    parameter Real Gcask = 0;
    parameter Real Bcask = 0;
    parameter Real Gcbsk = 0;
    parameter Real Bcbsk = 0;
    parameter Real Gccsk = Gshk;
    parameter Real Bccsk = Bshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = Gshm;
    parameter Real Baasm = Bshm;
    parameter Real Gabsm = 0;
    parameter Real Babsm = 0;
    parameter Real Gacsm = 0;
    parameter Real Bacsm = 0;
    parameter Real Gbasm = 0;
    parameter Real Bbasm = 0;
    parameter Real Gbbsm = Gshm;
    parameter Real Bbbsm = Bshm;
    parameter Real Gbcsm = 0;
    parameter Real Bbcsm = 0;
    parameter Real Gcasm = 0;
    parameter Real Bcasm = 0;
    parameter Real Gcbsm = 0;
    parameter Real Bcbsm = 0;
    parameter Real Gccsm = Gshm;
    parameter Real Bccsm = Bshm;

    //Calculating the parameters for the Transformer

    //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser;
    parameter Real C11i = -Baaser;
    parameter Real C12r = -Gabser;
    parameter Real C12i = -Babser;
    parameter Real C13r = -Gacser;
    parameter Real C13i = -Bacser;
    parameter Real C21r = -Gbaser;
    parameter Real C21i = -Bbaser;
    parameter Real C22r = -Gbbser;
    parameter Real C22i = -Bbbser;
    parameter Real C23r = -Gbcser;
    parameter Real C23i = -Bbcser;
    parameter Real C31r = -Gcaser;
    parameter Real C31i = -Bcaser;
    parameter Real C32r = -Gcbser;
    parameter Real C32i = -Bcbser;
    parameter Real C33r = -Gccser;
    parameter Real C33i = -Bccser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser+Gaasm;
    parameter Real D11i = Baaser+Baasm;
    parameter Real D12r = Gabser+Gabsm;
    parameter Real D12i = Babser+Babsm;
    parameter Real D13r = Gacser+Gacsm;
    parameter Real D13i = Bacser+Bacsm;
    parameter Real D21r = Gbaser+Gbasm;
    parameter Real D21i = Bbaser+Bbasm;
    parameter Real D22r = Gbbser+Gbbsm;
    parameter Real D22i = Bbbser+Bbbsm;
    parameter Real D23r = Gbcser+Gbcsm;
    parameter Real D23i = Bbcser+Bbcsm;
    parameter Real D31r = Gcaser+Gcasm;
    parameter Real D31i = Bcaser+Bcasm;
    parameter Real D32r = Gcbser+Gcbsm;
    parameter Real D32i = Bcbser+Bcbsm;
    parameter Real D33r = Gccser+Gccsm;
    parameter Real D33i = Bccser+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end Yg_Yg;

  function D_D
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;
  protected
    parameter Real sGser = ((1/tap)/3)*(2*R/(R*R+X*X));
    parameter Real sBser = ((1/tap)/3)*(-2*X/(R*R+X*X));
    parameter Real mGser = ((1/tap)/3)*(-R/(R*R+X*X));
    parameter Real mBser = ((1/tap)/3)*(X/(R*R+X*X));
    parameter Real sGshk = ((1-tap)/(3*tap*tap))*(2*R/(R*R+X*X));
    parameter Real sBshk = ((1-tap)/(3*tap*tap))*(-2*X/(R*R+X*X));
    parameter Real mGshk = ((1-tap)/(3*tap*tap))*(-R/(R*R+X*X));
    parameter Real mBshk = ((1-tap)/(3*tap*tap))*(X/(R*R+X*X));

   //Writing the Y_ser matrix according to Simulight
    parameter Real Gaaser = sGser;
    parameter Real Baaser = sBser;
    parameter Real Gabser = mGser;
    parameter Real Babser = mBser;
    parameter Real Gacser = mGser;
    parameter Real Bacser = mBser;
    parameter Real Gbaser = mGser;
    parameter Real Bbaser = mBser;
    parameter Real Gbbser = sGser;
    parameter Real Bbbser = sBser;
    parameter Real Gbcser = mGser;
    parameter Real Bbcser = mBser;
    parameter Real Gcaser = mGser;
    parameter Real Bcaser = mBser;
    parameter Real Gcbser = mGser;
    parameter Real Bcbser = mBser;
    parameter Real Gccser = sGser;
    parameter Real Bccser = sBser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = sGshk;
    parameter Real Baask = sBshk;
    parameter Real Gabsk = mGshk;
    parameter Real Babsk = mBshk;
    parameter Real Gacsk = mGshk;
    parameter Real Bacsk = mBshk;
    parameter Real Gbask = mGshk;
    parameter Real Bbask = mBshk;
    parameter Real Gbbsk = sGshk;
    parameter Real Bbbsk = sBshk;
    parameter Real Gbcsk = mGshk;
    parameter Real Bbcsk = mBshk;
    parameter Real Gcask = mGshk;
    parameter Real Bcask = mBshk;
    parameter Real Gcbsk = mGshk;
    parameter Real Bcbsk = mBshk;
    parameter Real Gccsk = sGshk;
    parameter Real Bccsk = sBshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = 0;
    parameter Real Baasm = 0;
    parameter Real Gabsm = 0;
    parameter Real Babsm = 0;
    parameter Real Gacsm = 0;
    parameter Real Bacsm = 0;
    parameter Real Gbasm = 0;
    parameter Real Bbasm = 0;
    parameter Real Gbbsm = 0;
    parameter Real Bbbsm = 0;
    parameter Real Gbcsm = 0;
    parameter Real Bbcsm = 0;
    parameter Real Gcasm = 0;
    parameter Real Bcasm = 0;
    parameter Real Gcbsm = 0;
    parameter Real Bcbsm = 0;
    parameter Real Gccsm = 0;
    parameter Real Bccsm = 0;

     //Calculating the parameters for the Transformer

    //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser;
    parameter Real C11i = -Baaser;
    parameter Real C12r = -Gabser;
    parameter Real C12i = -Babser;
    parameter Real C13r = -Gacser;
    parameter Real C13i = -Bacser;
    parameter Real C21r = -Gbaser;
    parameter Real C21i = -Bbaser;
    parameter Real C22r = -Gbbser;
    parameter Real C22i = -Bbbser;
    parameter Real C23r = -Gbcser;
    parameter Real C23i = -Bbcser;
    parameter Real C31r = -Gcaser;
    parameter Real C31i = -Bcaser;
    parameter Real C32r = -Gcbser;
    parameter Real C32i = -Bcbser;
    parameter Real C33r = -Gccser;
    parameter Real C33i = -Bccser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser+Gaasm;
    parameter Real D11i = Baaser+Baasm;
    parameter Real D12r = Gabser+Gabsm;
    parameter Real D12i = Babser+Babsm;
    parameter Real D13r = Gacser+Gacsm;
    parameter Real D13i = Bacser+Bacsm;
    parameter Real D21r = Gbaser+Gbasm;
    parameter Real D21i = Bbaser+Bbasm;
    parameter Real D22r = Gbbser+Gbbsm;
    parameter Real D22i = Bbbser+Bbbsm;
    parameter Real D23r = Gbcser+Gbcsm;
    parameter Real D23i = Bbcser+Bbcsm;
    parameter Real D31r = Gcaser+Gcasm;
    parameter Real D31i = Bcaser+Bcasm;
    parameter Real D32r = Gcbser+Gcbsm;
    parameter Real D32i = Bcbser+Bcbsm;
    parameter Real D33r = Gccser+Gccsm;
    parameter Real D33i = Bccser+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end D_D;

  function Y_Y
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;
  parameter Real sGser = ((1/tap)/3)*(2*R/(R*R+X*X));
    parameter Real sBser = ((1/tap)/3)*(-2*X/(R*R+X*X));
    parameter Real mGser = ((1/tap)/3)*(-R/(R*R+X*X));
    parameter Real mBser = ((1/tap)/3)*(X/(R*R+X*X));
    parameter Real sGshk = ((1-tap)/(3*tap*tap))*(2*R/(R*R+X*X));
    parameter Real sBshk = ((1-tap)/(3*tap*tap))*(-2*X/(R*R+X*X));
    parameter Real mGshk = ((1-tap)/(3*tap*tap))*(-R/(R*R+X*X));
    parameter Real mBshk = ((1-tap)/(3*tap*tap))*(X/(R*R+X*X));

    //Writing the Y_ser matrix according to Simulight
    parameter Real Gaaser = sGser;
    parameter Real Baaser = sBser;
    parameter Real Gabser = mGser;
    parameter Real Babser = mBser;
    parameter Real Gacser = mGser;
    parameter Real Bacser = mBser;
    parameter Real Gbaser = mGser;
    parameter Real Bbaser = mBser;
    parameter Real Gbbser = sGser;
    parameter Real Bbbser = sBser;
    parameter Real Gbcser = mGser;
    parameter Real Bbcser = mBser;
    parameter Real Gcaser = mGser;
    parameter Real Bcaser = mBser;
    parameter Real Gcbser = mGser;
    parameter Real Bcbser = mBser;
    parameter Real Gccser = sGser;
    parameter Real Bccser = sBser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = sGshk;
    parameter Real Baask = sBshk;
    parameter Real Gabsk = mGshk;
    parameter Real Babsk = mBshk;
    parameter Real Gacsk = mGshk;
    parameter Real Bacsk = mBshk;
    parameter Real Gbask = mGshk;
    parameter Real Bbask = mBshk;
    parameter Real Gbbsk = sGshk;
    parameter Real Bbbsk = sBshk;
    parameter Real Gbcsk = mGshk;
    parameter Real Bbcsk = mBshk;
    parameter Real Gcask = mGshk;
    parameter Real Bcask = mBshk;
    parameter Real Gcbsk = mGshk;
    parameter Real Bcbsk = mBshk;
    parameter Real Gccsk = sGshk;
    parameter Real Bccsk = sBshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = 0;
    parameter Real Baasm = 0;
    parameter Real Gabsm = 0;
    parameter Real Babsm = 0;
    parameter Real Gacsm = 0;
    parameter Real Bacsm = 0;
    parameter Real Gbasm = 0;
    parameter Real Bbasm = 0;
    parameter Real Gbbsm = 0;
    parameter Real Bbbsm = 0;
    parameter Real Gbcsm = 0;
    parameter Real Bbcsm = 0;
    parameter Real Gcasm = 0;
    parameter Real Bcasm = 0;
    parameter Real Gcbsm = 0;
    parameter Real Bcbsm = 0;
    parameter Real Gccsm = 0;
    parameter Real Bccsm = 0;

    //Calculating the parameters for the Transformer

   //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser;
    parameter Real C11i = -Baaser;
    parameter Real C12r = -Gabser;
    parameter Real C12i = -Babser;
    parameter Real C13r = -Gacser;
    parameter Real C13i = -Bacser;
    parameter Real C21r = -Gbaser;
    parameter Real C21i = -Bbaser;
    parameter Real C22r = -Gbbser;
    parameter Real C22i = -Bbbser;
    parameter Real C23r = -Gbcser;
    parameter Real C23i = -Bbcser;
    parameter Real C31r = -Gcaser;
    parameter Real C31i = -Bcaser;
    parameter Real C32r = -Gcbser;
    parameter Real C32i = -Bcbser;
    parameter Real C33r = -Gccser;
    parameter Real C33i = -Bccser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser+Gaasm;
    parameter Real D11i = Baaser+Baasm;
    parameter Real D12r = Gabser+Gabsm;
    parameter Real D12i = Babser+Babsm;
    parameter Real D13r = Gacser+Gacsm;
    parameter Real D13i = Bacser+Bacsm;
    parameter Real D21r = Gbaser+Gbasm;
    parameter Real D21i = Bbaser+Bbasm;
    parameter Real D22r = Gbbser+Gbbsm;
    parameter Real D22i = Bbbser+Bbbsm;
    parameter Real D23r = Gbcser+Gbcsm;
    parameter Real D23i = Bbcser+Bbcsm;
    parameter Real D31r = Gcaser+Gcasm;
    parameter Real D31i = Bcaser+Bcasm;
    parameter Real D32r = Gcbser+Gcbsm;
    parameter Real D32i = Bcbser+Bcbsm;
    parameter Real D33r = Gccser+Gccsm;
    parameter Real D33i = Bccser+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end Y_Y;

  function D_Yg
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;

  protected
    parameter Real sGser = (1/tap/sqrt(3))*(R/(R*R+X*X));
    parameter Real sBser = (1/tap/sqrt(3))*(-X/(R*R+X*X));
    parameter Real mGser = (1/tap/sqrt(3))*(-R/(R*R+X*X));
    parameter Real mBser = (1/tap/sqrt(3))*(X/(R*R+X*X));
    parameter Real sGshk = ((2/3/tap/tap)-(1/tap/sqrt(3)))*(R/(R*R+X*X));
    parameter Real sBshk = ((2/3/tap/tap)-(1/tap/sqrt(3)))*(-X/(R*R+X*X));
    parameter Real mGshk = ((1/3/tap/tap))*(-R/(R*R+X*X));
    parameter Real mBshk = ((1/3/tap/tap))*(X/(R*R+X*X));
    parameter Real nGshk = ((1/sqrt(3)/tap)-(1/3/tap/tap))*(R/(R*R+X*X));
    parameter Real nBshk = ((1/sqrt(3)/tap)-(1/3/tap/tap))*(-X/(R*R+X*X));
    parameter Real sGshm = (1-(1/tap/sqrt(3)))*(R/(R*R+X*X));
    parameter Real sBshm = (1-(1/tap/sqrt(3)))*(-X/(R*R+X*X));
    parameter Real mGshm = (1/tap/sqrt(3))*(R/(R*R+X*X));
    parameter Real mBshm = (1/tap/sqrt(3))*(-X/(R*R+X*X));

    //Writing the Y_ser1 matrix according to Simulight
    parameter Real Gaaser = sGser;
    parameter Real Baaser = sBser;
    parameter Real Gabser = 0;
    parameter Real Babser = 0;
    parameter Real Gacser = mGser;
    parameter Real Bacser = mBser;
    parameter Real Gbaser = mGser;
    parameter Real Bbaser = mBser;
    parameter Real Gbbser = sGser;
    parameter Real Bbbser = sBser;
    parameter Real Gbcser = 0;
    parameter Real Bbcser = 0;
    parameter Real Gcaser = 0;
    parameter Real Bcaser = 0;
    parameter Real Gcbser = mGser;
    parameter Real Bcbser = mBser;
    parameter Real Gccser = sGser;
    parameter Real Bccser = sBser;

    //Writing the Y_ser2 matrix according to Simulight
    parameter Real Gaaser2 = Gaaser;
    parameter Real Baaser2 = Baaser;
    parameter Real Gabser2 = Gbaser;
    parameter Real Babser2 = Bbaser;
    parameter Real Gacser2 = Gcaser;
    parameter Real Bacser2 = Bcaser;
    parameter Real Gbaser2 = Gabser;
    parameter Real Bbaser2 = Babser;
    parameter Real Gbbser2 = Gbbser;
    parameter Real Bbbser2 = Bbbser;
    parameter Real Gbcser2 = Gcbser;
    parameter Real Bbcser2 = Bcbser;
    parameter Real Gcaser2 = Gacser;
    parameter Real Bcaser2 = Bacser;
    parameter Real Gcbser2 = Gbcser;
    parameter Real Bcbser2 = Bbcser;
    parameter Real Gccser2 = Gccser;
    parameter Real Bccser2 = Bccser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = sGshk;
    parameter Real Baask = sBshk;
    parameter Real Gabsk = mGshk;
    parameter Real Babsk = mBshk;
    parameter Real Gacsk = nGshk;
    parameter Real Bacsk = nBshk;
    parameter Real Gbask = nGshk;
    parameter Real Bbask = nBshk;
    parameter Real Gbbsk = sGshk;
    parameter Real Bbbsk = sBshk;
    parameter Real Gbcsk = mGshk;
    parameter Real Bbcsk = mBshk;
    parameter Real Gcask = mGshk;
    parameter Real Bcask = mBshk;
    parameter Real Gcbsk = nGshk;
    parameter Real Bcbsk = nBshk;
    parameter Real Gccsk = sGshk;
    parameter Real Bccsk = sBshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = sGshm;
    parameter Real Baasm = sBshm;
    parameter Real Gabsm = mGshm;
    parameter Real Babsm = mBshm;
    parameter Real Gacsm = 0;
    parameter Real Bacsm = 0;
    parameter Real Gbasm = 0;
    parameter Real Bbasm = 0;
    parameter Real Gbbsm = sGshm;
    parameter Real Bbbsm = sBshm;
    parameter Real Gbcsm = mGshm;
    parameter Real Bbcsm = mBshm;
    parameter Real Gcasm = mGshm;
    parameter Real Bcasm = mBshm;
    parameter Real Gcbsm = 0;
    parameter Real Bcbsm = 0;
    parameter Real Gccsm = sGshm;
    parameter Real Bccsm = sBshm;

   //Calculating the parameters for the Transformer

     //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser2;
    parameter Real C11i = -Baaser2;
    parameter Real C12r = -Gabser2;
    parameter Real C12i = -Babser2;
    parameter Real C13r = -Gacser2;
    parameter Real C13i = -Bacser2;
    parameter Real C21r = -Gbaser2;
    parameter Real C21i = -Bbaser2;
    parameter Real C22r = -Gbbser2;
    parameter Real C22i = -Bbbser2;
    parameter Real C23r = -Gbcser2;
    parameter Real C23i = -Bbcser2;
    parameter Real C31r = -Gcaser2;
    parameter Real C31i = -Bcaser2;
    parameter Real C32r = -Gcbser2;
    parameter Real C32i = -Bcbser2;
    parameter Real C33r = -Gccser2;
    parameter Real C33i = -Bccser2;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser2+Gaasm;
    parameter Real D11i = Baaser2+Baasm;
    parameter Real D12r = Gabser2+Gabsm;
    parameter Real D12i = Babser2+Babsm;
    parameter Real D13r = Gacser2+Gacsm;
    parameter Real D13i = Bacser2+Bacsm;
    parameter Real D21r = Gbaser2+Gbasm;
    parameter Real D21i = Bbaser2+Bbasm;
    parameter Real D22r = Gbbser2+Gbbsm;
    parameter Real D22i = Bbbser2+Bbbsm;
    parameter Real D23r = Gbcser2+Gbcsm;
    parameter Real D23i = Bbcser2+Bbcsm;
    parameter Real D31r = Gcaser2+Gcasm;
    parameter Real D31i = Bcaser2+Bcasm;
    parameter Real D32r = Gcbser2+Gcbsm;
    parameter Real D32i = Bcbser2+Bcbsm;
    parameter Real D33r = Gccser2+Gccsm;
    parameter Real D33i = Bccser2+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end D_Yg;

  function Yg_D
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;

  protected
    parameter Real sGser = (1/tap/sqrt(3))*(R/(R*R+X*X));
    parameter Real sBser = (1/tap/sqrt(3))*(-X/(R*R+X*X));
    parameter Real mGser = (1/tap/sqrt(3))*(-R/(R*R+X*X));
    parameter Real mBser = (1/tap/sqrt(3))*(X/(R*R+X*X));
    
    parameter Real sGshk = ((1/tap)-(1/sqrt(3)))/tap*(R/(R*R+X*X));
    parameter Real sBshk = ((1/tap)-(1/sqrt(3)))/tap*(-X/(R*R+X*X));
    
    parameter Real sGshm = ((2/3)-(1/tap/sqrt(3)))*(R/(R*R+X*X));
    parameter Real sBshm = ((2/3)-(1/tap/sqrt(3)))*(-X/(R*R+X*X));
    parameter Real mGshm = (1/3)*(-R/(R*R+X*X));
    parameter Real mBshm = (1/3)*(X/(R*R+X*X));
    parameter Real nGshm = ((1/tap/sqrt(3))-(1/3))*(R/(R*R+X*X));
    parameter Real nBshm = ((1/tap/sqrt(3))-(1/3))*(-X/(R*R+X*X));

    //Writing the Y_ser1 matrix according to Simulight
    parameter Real Gaaser = sGser;
    parameter Real Baaser = sBser;
    parameter Real Gabser = mGser;
    parameter Real Babser = mBser;
    parameter Real Gacser = 0;
    parameter Real Bacser = 0;
    parameter Real Gbaser = 0;
    parameter Real Bbaser = 0;
    parameter Real Gbbser = sGser;
    parameter Real Bbbser = sBser;
    parameter Real Gbcser = mGser;
    parameter Real Bbcser = mBser;
    parameter Real Gcaser = mGser;
    parameter Real Bcaser = mBser;
    parameter Real Gcbser = 0;
    parameter Real Bcbser = 0;
    parameter Real Gccser = sGser;
    parameter Real Bccser = sBser;

    //Writing the Y_ser2 matrix according to Simulight
    parameter Real Gaaser2 = Gaaser;
    parameter Real Baaser2 = Baaser;
    parameter Real Gabser2 = Gbaser;
    parameter Real Babser2 = Bbaser;
    parameter Real Gacser2 = Gcaser;
    parameter Real Bacser2 = Bcaser;
    parameter Real Gbaser2 = Gabser;
    parameter Real Bbaser2 = Babser;
    parameter Real Gbbser2 = Gbbser;
    parameter Real Bbbser2 = Bbbser;
    parameter Real Gbcser2 = Gcbser;
    parameter Real Bbcser2 = Bcbser;
    parameter Real Gcaser2 = Gacser;
    parameter Real Bcaser2 = Bacser;
    parameter Real Gcbser2 = Gbcser;
    parameter Real Bcbser2 = Bbcser;
    parameter Real Gccser2 = Gccser;
    parameter Real Bccser2 = Bccser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = sGshk;
    parameter Real Baask = sBshk;
    parameter Real Gabsk = sGser;
    parameter Real Babsk = sBser;
    parameter Real Gacsk = 0;
    parameter Real Bacsk = 0;
    parameter Real Gbask = 0;
    parameter Real Bbask = 0;
    parameter Real Gbbsk = sGshk;
    parameter Real Bbbsk = sBshk;
    parameter Real Gbcsk = sGser;
    parameter Real Bbcsk = sBser;
    parameter Real Gcask = sGser;
    parameter Real Bcask = sBser;
    parameter Real Gcbsk = 0;
    parameter Real Bcbsk = 0;
    parameter Real Gccsk = sGshk;
    parameter Real Bccsk = sBshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = sGshm;
    parameter Real Baasm = sBshm;
    parameter Real Gabsm = mGshm;
    parameter Real Babsm = mBshm;
    parameter Real Gacsm = nGshm;
    parameter Real Bacsm = nBshm;
    parameter Real Gbasm = nGshm;
    parameter Real Bbasm = nBshm;
    parameter Real Gbbsm = sGshm;
    parameter Real Bbbsm = sBshm;
    parameter Real Gbcsm = mGshm;
    parameter Real Bbcsm = mBshm;
    parameter Real Gcasm = mGshm;
    parameter Real Bcasm = mBshm;
    parameter Real Gcbsm = nGshm;
    parameter Real Bcbsm = nBshm;
    parameter Real Gccsm = sGshm;
    parameter Real Bccsm = sBshm;

   //Calculating the parameters for the Transformer

     //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser2;
    parameter Real C11i = -Baaser2;
    parameter Real C12r = -Gabser2;
    parameter Real C12i = -Babser2;
    parameter Real C13r = -Gacser2;
    parameter Real C13i = -Bacser2;
    parameter Real C21r = -Gbaser2;
    parameter Real C21i = -Bbaser2;
    parameter Real C22r = -Gbbser2;
    parameter Real C22i = -Bbbser2;
    parameter Real C23r = -Gbcser2;
    parameter Real C23i = -Bbcser2;
    parameter Real C31r = -Gcaser2;
    parameter Real C31i = -Bcaser2;
    parameter Real C32r = -Gcbser2;
    parameter Real C32i = -Bcbser2;
    parameter Real C33r = -Gccser2;
    parameter Real C33i = -Bccser2;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser2+Gaasm;
    parameter Real D11i = Baaser2+Baasm;
    parameter Real D12r = Gabser2+Gabsm;
    parameter Real D12i = Babser2+Babsm;
    parameter Real D13r = Gacser2+Gacsm;
    parameter Real D13i = Bacser2+Bacsm;
    parameter Real D21r = Gbaser2+Gbasm;
    parameter Real D21i = Bbaser2+Bbasm;
    parameter Real D22r = Gbbser2+Gbbsm;
    parameter Real D22i = Bbbser2+Bbbsm;
    parameter Real D23r = Gbcser2+Gbcsm;
    parameter Real D23i = Bbcser2+Bbcsm;
    parameter Real D31r = Gcaser2+Gcasm;
    parameter Real D31i = Bcaser2+Bcasm;
    parameter Real D32r = Gcbser2+Gcbsm;
    parameter Real D32i = Bcbser2+Bcbsm;
    parameter Real D33r = Gccser2+Gccsm;
    parameter Real D33i = Bccser2+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end Yg_D;

  function Y_D
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;

  protected
    parameter Real sGser = ((1/tap)/sqrt(3))*(R/(R*R+X*X));
    parameter Real sBser = ((1/tap)/sqrt(3))*(-X/(R*R+X*X));
    parameter Real mGser = ((1/tap)/sqrt(3))*(-R/(R*R+X*X));
    parameter Real mBser = ((1/tap)/sqrt(3))*(X/(R*R+X*X));
    parameter Real sGshk = ((2-tap*sqrt(3))/(3*tap*tap))*(R/(R*R+X*X));
    parameter Real sBshk = ((2-tap*sqrt(3))/(3*tap*tap))*(-X/(R*R+X*X));
    parameter Real mGshk = ((tap*sqrt(3)-1)/(3*tap*tap))*(R/(R*R+X*X));
    parameter Real mBshk = ((tap*sqrt(3)-1)/(3*tap*tap))*(-X/(R*R+X*X));
    parameter Real nGshk = ((-1)/(3*tap*tap))*(R/(R*R+X*X));
    parameter Real nBshk = ((-1)/(3*tap*tap))*(-X/(R*R+X*X));
    parameter Real sGshm = ((2*tap-sqrt(3))/(3*tap))*(R/(R*R+X*X));
    parameter Real sBshm = ((2*tap-sqrt(3))/(3*tap))*(-X/(R*R+X*X));
    parameter Real mGshm = (-1/3)*(R/(R*R+X*X));
    parameter Real mBshm = (-1/3)*(-X/(R*R+X*X));
    parameter Real nGshm = ((sqrt(3)-tap)/(3*tap))*(R/(R*R+X*X));
    parameter Real nBshm = ((sqrt(3)-tap)/(3*tap))*(-X/(R*R+X*X));

    //Writing the Y_ser1 matrix according to Simulight
    parameter Real Gaaser = sGser;
    parameter Real Baaser = sBser;
    parameter Real Gabser = mGser;
    parameter Real Babser = mBser;
    parameter Real Gacser = 0;
    parameter Real Bacser = 0;
    parameter Real Gbaser = 0;
    parameter Real Bbaser = 0;
    parameter Real Gbbser = sGser;
    parameter Real Bbbser = sBser;
    parameter Real Gbcser = mGser;
    parameter Real Bbcser = mBser;
    parameter Real Gcaser = mGser;
    parameter Real Bcaser = mBser;
    parameter Real Gcbser = 0;
    parameter Real Bcbser = 0;
    parameter Real Gccser = sGser;
    parameter Real Bccser = sBser;

    //Writing the Y_ser2 matrix according to Simulight
    parameter Real Gaaser2 = Gaaser;
    parameter Real Baaser2 = Baaser;
    parameter Real Gabser2 = Gbaser;
    parameter Real Babser2 = Bbaser;
    parameter Real Gacser2 = Gcaser;
    parameter Real Bacser2 = Bcaser;
    parameter Real Gbaser2 = Gabser;
    parameter Real Bbaser2 = Babser;
    parameter Real Gbbser2 = Gbbser;
    parameter Real Bbbser2 = Bbbser;
    parameter Real Gbcser2 = Gcbser;
    parameter Real Bbcser2 = Bcbser;
    parameter Real Gcaser2 = Gacser;
    parameter Real Bcaser2 = Bacser;
    parameter Real Gcbser2 = Gbcser;
    parameter Real Bcbser2 = Bbcser;
    parameter Real Gccser2 = Gccser;
    parameter Real Bccser2 = Bccser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = sGshk;
    parameter Real Baask = sBshk;
    parameter Real Gabsk = mGshk;
    parameter Real Babsk = mBshk;
    parameter Real Gacsk = nGshk;
    parameter Real Bacsk = nBshk;
    parameter Real Gbask = nGshk;
    parameter Real Bbask = nBshk;
    parameter Real Gbbsk = sGshk;
    parameter Real Bbbsk = sBshk;
    parameter Real Gbcsk = mGshk;
    parameter Real Bbcsk = mBshk;
    parameter Real Gcask = mGshk;
    parameter Real Bcask = mBshk;
    parameter Real Gcbsk = nGshk;
    parameter Real Bcbsk = nBshk;
    parameter Real Gccsk = sGshk;
    parameter Real Bccsk = sBshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = sGshm;
    parameter Real Baasm = sBshm;
    parameter Real Gabsm = mGshm;
    parameter Real Babsm = mBshm;
    parameter Real Gacsm = nGshm;
    parameter Real Bacsm = nBshm;
    parameter Real Gbasm = nGshm;
    parameter Real Bbasm = nBshm;
    parameter Real Gbbsm = sGshm;
    parameter Real Bbbsm = sBshm;
    parameter Real Gbcsm = mGshm;
    parameter Real Bbcsm = mBshm;
    parameter Real Gcasm = mGshm;
    parameter Real Bcasm = mBshm;
    parameter Real Gcbsm = nGshm;
    parameter Real Bcbsm = nBshm;
    parameter Real Gccsm = sGshm;
    parameter Real Bccsm = sBshm;
  //Calculating the parameters for the Transformer

     //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser2;
    parameter Real C11i = -Baaser2;
    parameter Real C12r = -Gabser2;
    parameter Real C12i = -Babser2;
    parameter Real C13r = -Gacser2;
    parameter Real C13i = -Bacser2;
    parameter Real C21r = -Gbaser2;
    parameter Real C21i = -Bbaser2;
    parameter Real C22r = -Gbbser2;
    parameter Real C22i = -Bbbser2;
    parameter Real C23r = -Gbcser2;
    parameter Real C23i = -Bbcser2;
    parameter Real C31r = -Gcaser2;
    parameter Real C31i = -Bcaser2;
    parameter Real C32r = -Gcbser2;
    parameter Real C32i = -Bcbser2;
    parameter Real C33r = -Gccser2;
    parameter Real C33i = -Bccser2;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser2+Gaasm;
    parameter Real D11i = Baaser2+Baasm;
    parameter Real D12r = Gabser2+Gabsm;
    parameter Real D12i = Babser2+Babsm;
    parameter Real D13r = Gacser2+Gacsm;
    parameter Real D13i = Bacser2+Bacsm;
    parameter Real D21r = Gbaser2+Gbasm;
    parameter Real D21i = Bbaser2+Bbasm;
    parameter Real D22r = Gbbser2+Gbbsm;
    parameter Real D22i = Bbbser2+Bbbsm;
    parameter Real D23r = Gbcser2+Gbcsm;
    parameter Real D23i = Bbcser2+Bbcsm;
    parameter Real D31r = Gcaser2+Gcasm;
    parameter Real D31i = Bcaser2+Bcasm;
    parameter Real D32r = Gcbser2+Gcbsm;
    parameter Real D32i = Bcbser2+Bcbsm;
    parameter Real D33r = Gccser2+Gccsm;
    parameter Real D33i = Bccser2+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end Y_D;

  function D_Y
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;

  protected
    parameter Real sGser = ((1/tap)/sqrt(3))*(R/(R*R+X*X));
    parameter Real sBser = ((1/tap)/sqrt(3))*(-X/(R*R+X*X));
    parameter Real mGser = ((1/tap)/sqrt(3))*(-R/(R*R+X*X));
    parameter Real mBser = ((1/tap)/sqrt(3))*(X/(R*R+X*X));

    parameter Real sGshk = ((2-tap*sqrt(3))/(3*tap*tap))*(R/(R*R+X*X));
    parameter Real sBshk = ((2-tap*sqrt(3))/(3*tap*tap))*(-X/(R*R+X*X));
    parameter Real mGshk = ((tap*sqrt(3)-1)/(3*tap*tap))*(R/(R*R+X*X));
    parameter Real mBshk = ((tap*sqrt(3)-1)/(3*tap*tap))*(-X/(R*R+X*X));
    parameter Real nGshk = ((-1)/(3*tap*tap))*(R/(R*R+X*X));
    parameter Real nBshk = ((-1)/(3*tap*tap))*(-X/(R*R+X*X));

    parameter Real sGshm = ((2*tap-sqrt(3))/(3*tap))*(R/(R*R+X*X));
    parameter Real sBshm = ((2*tap-sqrt(3))/(3*tap))*(-X/(R*R+X*X));
    parameter Real mGshm = (-1/3)*(R/(R*R+X*X));
    parameter Real mBshm = (-1/3)*(-X/(R*R+X*X));
    parameter Real nGshm = ((sqrt(3)-tap)/(3*tap))*(R/(R*R+X*X));
    parameter Real nBshm = ((sqrt(3)-tap)/(3*tap))*(-X/(R*R+X*X));

    //Writing the Y_ser1 matrix according to Simulight
    parameter Real Gaaser = sGser;
    parameter Real Baaser = sBser;
    parameter Real Gabser = mGser;
    parameter Real Babser = mBser;
    parameter Real Gacser = 0;
    parameter Real Bacser = 0;
    parameter Real Gbaser = 0;
    parameter Real Bbaser = 0;
    parameter Real Gbbser = sGser;
    parameter Real Bbbser = sBser;
    parameter Real Gbcser = mGser;
    parameter Real Bbcser = mBser;
    parameter Real Gcaser = mGser;
    parameter Real Bcaser = mBser;
    parameter Real Gcbser = 0;
    parameter Real Bcbser = 0;
    parameter Real Gccser = sGser;
    parameter Real Bccser = sBser;

    //Writing the Y_ser2 matrix according to Simulight
    parameter Real Gaaser2 = Gaaser;
    parameter Real Baaser2 = Baaser;
    parameter Real Gabser2 = Gbaser;
    parameter Real Babser2 = Bbaser;
    parameter Real Gacser2 = Gcaser;
    parameter Real Bacser2 = Bcaser;
    parameter Real Gbaser2 = Gabser;
    parameter Real Bbaser2 = Babser;
    parameter Real Gbbser2 = Gbbser;
    parameter Real Bbbser2 = Bbbser;
    parameter Real Gbcser2 = Gcbser;
    parameter Real Bbcser2 = Bcbser;
    parameter Real Gcaser2 = Gacser;
    parameter Real Bcaser2 = Bacser;
    parameter Real Gcbser2 = Gbcser;
    parameter Real Bcbser2 = Bbcser;
    parameter Real Gccser2 = Gccser;
    parameter Real Bccser2 = Bccser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = sGshk;
    parameter Real Baask = sBshk;
    parameter Real Gabsk = mGshk;
    parameter Real Babsk = mBshk;
    parameter Real Gacsk = nGshk;
    parameter Real Bacsk = nBshk;
    parameter Real Gbask = nGshk;
    parameter Real Bbask = nBshk;
    parameter Real Gbbsk = sGshk;
    parameter Real Bbbsk = sBshk;
    parameter Real Gbcsk = mGshk;
    parameter Real Bbcsk = mBshk;
    parameter Real Gcask = mGshk;
    parameter Real Bcask = mBshk;
    parameter Real Gcbsk = nGshk;
    parameter Real Bcbsk = nBshk;
    parameter Real Gccsk = sGshk;
    parameter Real Bccsk = sBshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = sGshm;
    parameter Real Baasm = sBshm;
    parameter Real Gabsm = mGshm;
    parameter Real Babsm = mBshm;
    parameter Real Gacsm = nGshm;
    parameter Real Bacsm = nBshm;
    parameter Real Gbasm = nGshm;
    parameter Real Bbasm = nBshm;
    parameter Real Gbbsm = sGshm;
    parameter Real Bbbsm = sBshm;
    parameter Real Gbcsm = mGshm;
    parameter Real Bbcsm = mBshm;
    parameter Real Gcasm = mGshm;
    parameter Real Bcasm = mBshm;
    parameter Real Gcbsm = nGshm;
    parameter Real Bcbsm = nBshm;
    parameter Real Gccsm = sGshm;
    parameter Real Bccsm = sBshm;
  //Calculating the parameters for the Transformer

     //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser2;
    parameter Real C11i = -Baaser2;
    parameter Real C12r = -Gabser2;
    parameter Real C12i = -Babser2;
    parameter Real C13r = -Gacser2;
    parameter Real C13i = -Bacser2;
    parameter Real C21r = -Gbaser2;
    parameter Real C21i = -Bbaser2;
    parameter Real C22r = -Gbbser2;
    parameter Real C22i = -Bbbser2;
    parameter Real C23r = -Gbcser2;
    parameter Real C23i = -Bbcser2;
    parameter Real C31r = -Gcaser2;
    parameter Real C31i = -Bcaser2;
    parameter Real C32r = -Gcbser2;
    parameter Real C32i = -Bcbser2;
    parameter Real C33r = -Gccser2;
    parameter Real C33i = -Bccser2;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser2+Gaasm;
    parameter Real D11i = Baaser2+Baasm;
    parameter Real D12r = Gabser2+Gabsm;
    parameter Real D12i = Babser2+Babsm;
    parameter Real D13r = Gacser2+Gacsm;
    parameter Real D13i = Bacser2+Bacsm;
    parameter Real D21r = Gbaser2+Gbasm;
    parameter Real D21i = Bbaser2+Bbasm;
    parameter Real D22r = Gbbser2+Gbbsm;
    parameter Real D22i = Bbbser2+Bbbsm;
    parameter Real D23r = Gbcser2+Gbcsm;
    parameter Real D23i = Bbcser2+Bbcsm;
    parameter Real D31r = Gcaser2+Gcasm;
    parameter Real D31i = Bcaser2+Bcasm;
    parameter Real D32r = Gcbser2+Gcbsm;
    parameter Real D32i = Bcbser2+Bcbsm;
    parameter Real D33r = Gccser2+Gccsm;
    parameter Real D33i = Bccser2+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end D_Y;

  function Yg_Y
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;
  protected
    parameter Real sGser = ((1/tap)/3)*(2*R/(R*R+X*X));
    parameter Real sBser = ((1/tap)/3)*(-2*X/(R*R+X*X));
    parameter Real mGser = ((1/tap)/3)*(-R/(R*R+X*X));
    parameter Real mBser = ((1/tap)/3)*(X/(R*R+X*X));

    parameter Real sGshk = ((3-2*tap)/(3*tap*tap))*(R/(R*R+X*X));
    parameter Real sBshk = ((3-2*tap)/(3*tap*tap))*(-X/(R*R+X*X));
    parameter Real mGshk = (1/(3*tap))*(R/(R*R+X*X));
    parameter Real mBshk = (1/(3*tap))*(-X/(R*R+X*X));

    parameter Real sGshm = ((tap-1)/(3*tap))*(2*R/(R*R+X*X));
    parameter Real sBshm = ((tap-1)/(3*tap))*(-2*X/(R*R+X*X));
    parameter Real mGshm = ((tap-1)/(3*tap))*(-R/(R*R+X*X));
    parameter Real mBshm = ((tap-1)/(3*tap))*(X/(R*R+X*X));

    //Writing the Y_ser matrix according to Simulight
    parameter Real Gaaser = sGser;
    parameter Real Baaser = sBser;
    parameter Real Gabser = mGser;
    parameter Real Babser = mBser;
    parameter Real Gacser = mGser;
    parameter Real Bacser = mBser;
    parameter Real Gbaser = mGser;
    parameter Real Bbaser = mBser;
    parameter Real Gbbser = sGser;
    parameter Real Bbbser = sBser;
    parameter Real Gbcser = mGser;
    parameter Real Bbcser = mBser;
    parameter Real Gcaser = mGser;
    parameter Real Bcaser = mBser;
    parameter Real Gcbser = mGser;
    parameter Real Bcbser = mBser;
    parameter Real Gccser = sGser;
    parameter Real Bccser = sBser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = sGshk;
    parameter Real Baask = sBshk;
    parameter Real Gabsk = mGshk;
    parameter Real Babsk = mBshk;
    parameter Real Gacsk = mGshk;
    parameter Real Bacsk = mBshk;
    parameter Real Gbask = mGshk;
    parameter Real Bbask = mBshk;
    parameter Real Gbbsk = sGshk;
    parameter Real Bbbsk = sBshk;
    parameter Real Gbcsk = mGshk;
    parameter Real Bbcsk = mBshk;
    parameter Real Gcask = mGshk;
    parameter Real Bcask = mBshk;
    parameter Real Gcbsk = mGshk;
    parameter Real Bcbsk = mBshk;
    parameter Real Gccsk = sGshk;
    parameter Real Bccsk = sBshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = sGshm;
    parameter Real Baasm = sBshm;
    parameter Real Gabsm = mGshm;
    parameter Real Babsm = mBshm;
    parameter Real Gacsm = mGshm;
    parameter Real Bacsm = mBshm;
    parameter Real Gbasm = mGshm;
    parameter Real Bbasm = mBshm;
    parameter Real Gbbsm = sGshm;
    parameter Real Bbbsm = sBshm;
    parameter Real Gbcsm = mGshm;
    parameter Real Bbcsm = mBshm;
    parameter Real Gcasm = mGshm;
    parameter Real Bcasm = mBshm;
    parameter Real Gcbsm = mGshm;
    parameter Real Bcbsm = mBshm;
    parameter Real Gccsm = sGshm;
    parameter Real Bccsm = sBshm;

  //Calculating the parameters for the Transformer

    //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser;
    parameter Real C11i = -Baaser;
    parameter Real C12r = -Gabser;
    parameter Real C12i = -Babser;
    parameter Real C13r = -Gacser;
    parameter Real C13i = -Bacser;
    parameter Real C21r = -Gbaser;
    parameter Real C21i = -Bbaser;
    parameter Real C22r = -Gbbser;
    parameter Real C22i = -Bbbser;
    parameter Real C23r = -Gbcser;
    parameter Real C23i = -Bbcser;
    parameter Real C31r = -Gcaser;
    parameter Real C31i = -Bcaser;
    parameter Real C32r = -Gcbser;
    parameter Real C32i = -Bcbser;
    parameter Real C33r = -Gccser;
    parameter Real C33i = -Bccser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser+Gaasm;
    parameter Real D11i = Baaser+Baasm;
    parameter Real D12r = Gabser+Gabsm;
    parameter Real D12i = Babser+Babsm;
    parameter Real D13r = Gacser+Gacsm;
    parameter Real D13i = Bacser+Bacsm;
    parameter Real D21r = Gbaser+Gbasm;
    parameter Real D21i = Bbaser+Bbasm;
    parameter Real D22r = Gbbser+Gbbsm;
    parameter Real D22i = Bbbser+Bbbsm;
    parameter Real D23r = Gbcser+Gbcsm;
    parameter Real D23i = Bbcser+Bbcsm;
    parameter Real D31r = Gcaser+Gcasm;
    parameter Real D31i = Bcaser+Bcasm;
    parameter Real D32r = Gcbser+Gcbsm;
    parameter Real D32i = Bcbser+Bcbsm;
    parameter Real D33r = Gccser+Gccsm;
    parameter Real D33i = Bccser+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end Yg_Y;

  function Y_Yg
    input Real X;
    input Real R;
    input Real tap;
    output Real[1,72] V;
  protected
    parameter Real sGser = ((1/tap)/3)*(2*R/(R*R+X*X));
    parameter Real sBser = ((1/tap)/3)*(-2*X/(R*R+X*X));
    parameter Real mGser = ((1/tap)/3)*(-R/(R*R+X*X));
    parameter Real mBser = ((1/tap)/3)*(X/(R*R+X*X));

    parameter Real sGshk = ((1-tap)/(3*tap*tap))*(2*R/(R*R+X*X));
    parameter Real sBshk = ((1-tap)/(3*tap*tap))*(-2*X/(R*R+X*X));
    parameter Real mGshk = ((1-tap)/(3*tap*tap))*(-R/(R*R+X*X));
    parameter Real mBshk = ((1-tap)/(3*tap*tap))*(X/(R*R+X*X));

    parameter Real sGshm = ((3*tap-2)/(3*tap))*(R/(R*R+X*X));
    parameter Real sBshm = ((3*tap-2)/(3*tap))*(-X/(R*R+X*X));
    parameter Real mGshm = (1/(3*tap))*(R/(R*R+X*X));
    parameter Real mBshm = (1/(3*tap))*(-X/(R*R+X*X));

    //Writing the Y_ser matrix according to Simulight
    parameter Real Gaaser = sGser;
    parameter Real Baaser = sBser;
    parameter Real Gabser = mGser;
    parameter Real Babser = mBser;
    parameter Real Gacser = mGser;
    parameter Real Bacser = mBser;
    parameter Real Gbaser = mGser;
    parameter Real Bbaser = mBser;
    parameter Real Gbbser = sGser;
    parameter Real Bbbser = sBser;
    parameter Real Gbcser = mGser;
    parameter Real Bbcser = mBser;
    parameter Real Gcaser = mGser;
    parameter Real Bcaser = mBser;
    parameter Real Gcbser = mGser;
    parameter Real Bcbser = mBser;
    parameter Real Gccser = sGser;
    parameter Real Bccser = sBser;

    //Writing the Y_sht_k matrix according to Simulight
    parameter Real Gaask = sGshk;
    parameter Real Baask = sBshk;
    parameter Real Gabsk = mGshk;
    parameter Real Babsk = mBshk;
    parameter Real Gacsk = mGshk;
    parameter Real Bacsk = mBshk;
    parameter Real Gbask = mGshk;
    parameter Real Bbask = mBshk;
    parameter Real Gbbsk = sGshk;
    parameter Real Bbbsk = sBshk;
    parameter Real Gbcsk = mGshk;
    parameter Real Bbcsk = mBshk;
    parameter Real Gcask = mGshk;
    parameter Real Bcask = mBshk;
    parameter Real Gcbsk = mGshk;
    parameter Real Bcbsk = mBshk;
    parameter Real Gccsk = sGshk;
    parameter Real Bccsk = sBshk;

     //Writing the Y_sht_m matrix according to Simulight
    parameter Real Gaasm = sGshm;
    parameter Real Baasm = sBshm;
    parameter Real Gabsm = mGshm;
    parameter Real Babsm = mBshm;
    parameter Real Gacsm = mGshm;
    parameter Real Bacsm = mBshm;
    parameter Real Gbasm = mGshm;
    parameter Real Bbasm = mBshm;
    parameter Real Gbbsm = sGshm;
    parameter Real Bbbsm = sBshm;
    parameter Real Gbcsm = mGshm;
    parameter Real Bbcsm = mBshm;
    parameter Real Gcasm = mGshm;
    parameter Real Bcasm = mBshm;
    parameter Real Gcbsm = mGshm;
    parameter Real Bcbsm = mBshm;
    parameter Real Gccsm = sGshm;
    parameter Real Bccsm = sBshm;

    //Calculating the parameters for the Transformer

    //Writing the matrix A (Yser1+Yshtk)
    parameter Real A11r = Gaaser+Gaask;
    parameter Real A11i = Baaser+Baask;
    parameter Real A12r = Gabser+Gabsk;
    parameter Real A12i = Babser+Babsk;
    parameter Real A13r = Gacser+Gacsk;
    parameter Real A13i = Bacser+Bacsk;
    parameter Real A21r = Gbaser+Gbask;
    parameter Real A21i = Bbaser+Bbask;
    parameter Real A22r = Gbbser+Gbbsk;
    parameter Real A22i = Bbbser+Bbbsk;
    parameter Real A23r = Gbcser+Gbcsk;
    parameter Real A23i = Bbcser+Bbcsk;
    parameter Real A31r = Gcaser+Gcask;
    parameter Real A31i = Bcaser+Bcask;
    parameter Real A32r = Gcbser+Gcbsk;
    parameter Real A32i = Bcbser+Bcbsk;
    parameter Real A33r = Gccser+Gccsk;
    parameter Real A33i = Bccser+Bccsk;

    //Writing the matrix B (-Yser1)
    parameter Real B11r = -Gaaser;
    parameter Real B11i = -Baaser;
    parameter Real B12r = -Gabser;
    parameter Real B12i = -Babser;
    parameter Real B13r = -Gacser;
    parameter Real B13i = -Bacser;
    parameter Real B21r = -Gbaser;
    parameter Real B21i = -Bbaser;
    parameter Real B22r = -Gbbser;
    parameter Real B22i = -Bbbser;
    parameter Real B23r = -Gbcser;
    parameter Real B23i = -Bbcser;
    parameter Real B31r = -Gcaser;
    parameter Real B31i = -Bcaser;
    parameter Real B32r = -Gcbser;
    parameter Real B32i = -Bcbser;
    parameter Real B33r = -Gccser;
    parameter Real B33i = -Bccser;

    //Writing the matrix MC (-Yser2)
    parameter Real C11r = -Gaaser;
    parameter Real C11i = -Baaser;
    parameter Real C12r = -Gabser;
    parameter Real C12i = -Babser;
    parameter Real C13r = -Gacser;
    parameter Real C13i = -Bacser;
    parameter Real C21r = -Gbaser;
    parameter Real C21i = -Bbaser;
    parameter Real C22r = -Gbbser;
    parameter Real C22i = -Bbbser;
    parameter Real C23r = -Gbcser;
    parameter Real C23i = -Bbcser;
    parameter Real C31r = -Gcaser;
    parameter Real C31i = -Bcaser;
    parameter Real C32r = -Gcbser;
    parameter Real C32i = -Bcbser;
    parameter Real C33r = -Gccser;
    parameter Real C33i = -Bccser;

    //Writing the matrix D (Yser2+Yshtm)
    parameter Real D11r = Gaaser+Gaasm;
    parameter Real D11i = Baaser+Baasm;
    parameter Real D12r = Gabser+Gabsm;
    parameter Real D12i = Babser+Babsm;
    parameter Real D13r = Gacser+Gacsm;
    parameter Real D13i = Bacser+Bacsm;
    parameter Real D21r = Gbaser+Gbasm;
    parameter Real D21i = Bbaser+Bbasm;
    parameter Real D22r = Gbbser+Gbbsm;
    parameter Real D22i = Bbbser+Bbbsm;
    parameter Real D23r = Gbcser+Gbcsm;
    parameter Real D23i = Bbcser+Bbcsm;
    parameter Real D31r = Gcaser+Gcasm;
    parameter Real D31i = Bcaser+Bcasm;
    parameter Real D32r = Gcbser+Gcbsm;
    parameter Real D32i = Bcbser+Bcbsm;
    parameter Real D33r = Gccser+Gccsm;
    parameter Real D33i = Bccser+Bccsm;

  algorithm
    V := [A11r, A11i, A12r, A12i, A13r, A13i, A21r, A21i, A22r, A22i, A23r, A23i, A31r, A31i, A32r, A32i, A33r, A33i, B11r, B11i, B12r, B12i, B13r, B13i, B21r, B21i, B22r, B22i, B23r, B23i, B31r, B31i, B32r, B32i, B33r, B33i, C11r, C11i, C12r, C12i, C13r, C13i, C21r, C21i, C22r, C22i, C23r, C23i, C31r, C31i, C32r, C32i, C33r, C33i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i, D31r, D31i, D32r, D32i, D33r, D33i];
  end Y_Yg;
end TransfConnection;
