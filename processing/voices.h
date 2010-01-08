#ifndef VOICES_H
#define VOICES_H

#include "oscillators.h"
#include "tools.h"
#include "effects.h"

#define voiceCount 32

typedef struct voice {
	char act;
	struct voice *preVoice, *postVoice;
	float freq;
	int velocity;
	osc *oscs;
	osc *lfos;
	float* output;
} voice;

typedef struct {
	int oscCount;
	int lfoCount;
} voiceSettings;

void initVoices();
void initVoice(voice*);

void compVoices();
void compVoice(voice*);

void playSound(int note, int velocity);
void stopSound(int note, int velocity);

float getFreq(int note);

voice voices[voiceCount];
voiceSettings globalVoiceSettings;
voice *firstVoice, *lastVoice;
float actVoices;

osc gLfo;

float voicesOutput;

#endif