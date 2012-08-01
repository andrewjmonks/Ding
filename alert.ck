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

fun void alarm(){
    spork ~ stairs(100, 200, .05);
    spork ~ stairs(50, 200, .03);
    spork ~ stairs(100, 200, .01);
    2::second => now;
}


spork ~ alarm();
3::second => now;