Fs = 15000;      %# Samples per second
toneFreq = 10000;  %# Tone frequency, in Hertz
nSeconds = .2;   %# Duration of the sound
y = sin(linspace(0, nSeconds*toneFreq*2*pi, round(nSeconds*Fs)));
sound(y, Fs);  %# Play sound at sampling rate Fs