# Acoustic Calibration and Reporting Guidance

## Scope

`PerceptionTests` generates digital stimuli and records behavioural responses. It does **not** measure or set the sound-pressure level at the listener's ear. Acoustic output depends on the complete playback chain: the Windows mixer, audio interface or sound card, amplifier, headphones or loudspeakers, their frequency response, and the physical fit or position of the transducer.

Calibration is therefore part of the laboratory protocol rather than an automatic application feature.

## Amplitude

The amplitude values stored in the experiment configuration determine the relative digital sample amplitude before playback. They do not directly specify dB SPL and should not be interpreted as an equal-loudness model.

In the distributed Experiment 3 configuration, tones below 600 Hz use `lowFrequencyGainMultiplier: 2.0`. This doubles their digital PCM sample amplitude relative to the higher-frequency tones, corresponding to an amplitude difference of approximately 6.02 dB. The rule reproduces the released stimulus definition. It does not compensate automatically for headphone response, listener sensitivity, or equal-loudness contours.

Changing either `lowFrequencyGainBelowHz` or `lowFrequencyGainMultiplier` changes the study protocol. Record and archive every such change.

## Recommended playback chain

Use the same equipment and software settings for all participants within a study:

- one identified audio interface or sound card;
- one identified headphone or loudspeaker model;
- a fixed sample rate and Windows playback-device configuration;
- fixed hardware and operating-system volume settings;
- disabled spatial audio, loudness equalisation, bass enhancement, automatic gain control, virtual surround, and other signal-processing enhancements;
- no Bluetooth link when latency or codec processing could affect the protocol;
- a quiet test environment appropriate for the study.

For headphone studies, use a calibrated ear simulator, artificial ear, or coupler appropriate to the transducer when available. For loudspeaker studies, use a calibrated measurement microphone at the defined listening position.

## Pre-study calibration procedure

1. **Prepare the final workstation.** Use the same computer, interface, transducer, cabling, Windows output device, and application release intended for data collection.
2. **Disable processing.** Disable Windows audio enhancements, spatial sound, manufacturer effects, automatic gain control, and communication-volume attenuation.
3. **Fix the signal path.** Select one output device and note the Windows volume value, interface or amplifier gain, sample rate, and channel routing.
4. **Generate representative stimuli.** Run the application or use WAV files generated from the exact experiment configuration. Include every test frequency or a justified calibration subset.
5. **Measure acoustic output.** Measure the level using the laboratory's calibrated coupler, artificial ear, or microphone procedure. Record the measurement standard, weighting, averaging method, and uncertainty where applicable.
6. **Set the target level externally.** Adjust the hardware or system playback level to the study's target. Do not alter frequency-specific JSON multipliers merely to reach an overall listening level unless that change is an intentional, documented protocol revision.
7. **Check frequency consistency.** Record the measured output for the frequencies used in each experiment. Decide and document the permitted deviation from the study target.
8. **Lock the settings.** Prevent participants from changing volume. Recheck the selected output device before each session.
9. **Archive evidence.** Retain the calibration record, equipment identifiers, application version, configuration files, date, and operator name with the study documentation.

## Reporting template

Reporting template for a study record:

```text
Application release:
Experiment-configuration file and checksum:
Questionnaire-configuration version:
Computer and operating system:
Audio interface / sound card:
Driver and audio mode:
Headphone or loudspeaker model:
Transducer coupling / placement:
Calibration instrument and last calibration date:
Measurement method and standard:
Target level and tolerance:
Measured levels by test frequency or frequency group:
Windows volume setting:
Interface / amplifier gain setting:
Disabled audio enhancements:
Calibration date and operator:
```

## Latency

Acoustic level calibration does not compensate for playback or response latency. `PerceptionTests` uses the standard Windows audio stack and application-level response timing. Studies requiring hardware-referenced acoustic onset should measure the complete input-output latency separately and report the method used.

## Hearing safety

Use levels appropriate to the study population, stimulus duration, and local ethics and occupational-safety requirements. Begin validation at a conservative level. Stop testing if a participant reports discomfort, pain, tinnitus, or other adverse effects.

## Reproducibility checklist

Before data collection, confirm that:

- the application version is fixed;
- the exact experiment and questionnaire JSON files are archived;
- the playback chain has been calibrated;
- relative digital gain rules are distinguished from acoustic calibration;
- the selected device and volume settings are locked;
- a complete validation run produces the expected WAV and JSON output;
- the calibration and latency limitations are described in the study protocol.
