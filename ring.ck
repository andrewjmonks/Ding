fun void stairs(int inA, int inB, float step){
    SinOsc a => dac;
    inA => a.freq;
    .1 => a.gain;
    
    SinOsc b => dac;
    inB => b.freq;
    .1 => b.gain;
    
    while(b.freq() < 500){
        step::second => now;
        a.freq() * 1.2 => a.freq;
        b.freq() + 20 => b.freq;
    }
}


fun void ring(){
    spork ~ stairs(100,200,.2);
    1::second => now;
    spork ~ stairs(200,200,.05);
    1::second => now;
    spork ~ stairs(100,200,.1);
    .5::second => now;
    spork ~ stairs(200,200,.05);
    2::second => now;
}


spork ~ ring();
10::second => now;