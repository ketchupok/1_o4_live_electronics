# Csound version for LE Setup of "1 of 4"


This code is written in Csound 7-alpha and CsoundQt 7-alpha, and it requires these versions (or later) to run properly. Because it uses the new local sample rate feature introduced in Csound 7, which is not supported in earlier versions. For best compatibility and performance, it's recommended to use CsoundQt-7 alongside Csound-7.

The project is available in two versions: one coded in a traditional style and the other in a functional style. Both versions produce identical results. The only difference lies in their coding approach, allowing users to choose based on preference.

To run the project, first select the local sample rate, then start the engine in the CsoundQt-7 Widgets Panel (top right corner). Then click on "generate random Freqs / Amps" (top left) to tune the oscillators. You must then activate at least two oscillators (grey boxes in left column). The setup includes eleven oscillators for audio synthesis and one additional oscillator intended for use as an LFO (Low-Frequency Oscillator).
