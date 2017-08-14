// This sketch shows how to use the Amplitude class to analyze a
// stream of sound. In this case a sample is analyzed. Smooth_factor
// determines how much the signal will be smoothed on a scale
// form 0-1.

import processing.sound.*;

// Declare the processing sound variables (amplitude, input)
Amplitude rms;
AudioIn input;

// Declare a scaling factor
float scale=5;

// Declare a smooth factor
float smooth_factor=0.04;

// Used for smoothing
float sum;

public void setup() {
    size(640,360);

    //Create an Audio input and grab the 1st channel
    input = new AudioIn(this, 0);
    
    // start the Audio Input
    input.start();
    input.amp(1.0);
    
    // create a new Amplitude analyzer
    rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    rms.input(input);
}      

public void draw() {
    // Set background color, noStroke and fill color
    background(0);
    noStroke();
    fill(255,0,150);
    
    // smooth the rms data by smoothing factor
    sum += (rms.analyze() - sum) * smooth_factor;  

    // rms.analyze() return a value between 0 and 1. It's
    // scaled to height/2 and then multiplied by a scale factor
    float rms_scaled=sum*(height/2)*scale;

    // We draw an ellispe coupled to the audio analysis
    ellipse(width/2, height/2, rms_scaled, rms_scaled);
}