# Lyrebird

Simple and powerful voice changer for Linux, written in GTK 3.

![Lyrebird Screenshot](https://raw.githubusercontent.com/lyrebird-voice-changer/lyrebird/master/preview.png)

## Usage

1.  Select a preset or set a custom pitch and flip the switch
2.  Change the input device for the application to **Lyrebird Virtual Input**, this can be done in-app or using `pavucontrol` if you're not given the option
3.  Ignore any applications that ask if you want to use "Lyrebird Output" (e.g. Discord), this is used internally and isn't necessary to use Lyrebird

### Changing using `pavucontrol`

If an app doesn't support live input changing then it can be done with `pavucontrol`. Head to the "Recording" tab and change the input using the drop down next to the application name.

For some apps on some distros (like Ubuntu) changing the input won't work. To fix this you need to create a file at `~/.alsoftrc` and add the following contents:

```ini
drivers = alsa,pulse,core,oss

[pulse]
allow-moves=yes
```

### Editing Presets

Presets and config is initally stored in `/etc/lyrebird/` however it can be overriden by copying the files to `~/.config/lyrebird/`.

To edit and add your own presets edit the file `presets.toml`, this file is in the TOML format and the syntax is described below.

```toml
# name = Preset name, will be displayed in the GUI
# pitch_value = The pitch value of the preset, if you want to be able to adjust this use "scale"
# downsample_amount = The amount of downsampling to do, set as "none" if you don't want any
# override_pitch_slider = Whether the preset overrides the pitch slider or not
# volume_boost = The amount of decibels to boost by

# Example preset, the [[presets]] is required for each preset
[[presets]]
name = "Woman"
pitch_value = "2.5"
downsample_amount = "none"
override_pitch_slider = true

# Boost by 2 dB to make the voice louder
volume_boost = "2"
```
