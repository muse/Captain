# Captain
Getting started with Lemonbar usually isn't the easiest thing to do. It's not
*very* well documented and lacks a big community. It is however one of the best
and customizable bars to use. I took the challange upon me of making a simple to
use dynamic lemonbar wrapper. Initially it was a pretty difficult task trying
to figure out how to make it as easy as possible to use, while not losing any
of the core/key functionality. I decided to split it up in 3 sections.

* The `captain` daemon.
* The `captin.d(irectory)` containing seperate scripts to display content
* The `captainrc` file managing the visual aspects.

You can read more about how to use these and what these do specifically at the
bottom.

## Getting started
It's really easy to start using Captain, don't worry. Everyone can do it.
You need very little bash/command line skills.

### Dependencies
* Lemonbar (Lemonbar-xft also works and is recommended)
* Bash `4.*.*`
* Python ``3.*.*``
* Git `2.*.*` (Only required when cloning the files, lower version might also work)

### Getting the files
You first of all will need to clone the files. I highly recommend using the command
line for this:

```
$ git clone https://github.com/muse/captain
```

You'll now have all the files locally in a folder named `captain` and can start
the deamon by running the `captian` executable in there. Make sure to set `+x` to
the `captain` executable and atleast `+r` to the `captain.d` scripts.

### Put them accordingly
You want to move the files to where they fit nicely in your current structure,
for me this would be `~/.config/bspwm/captain`, but this can be different for
anyone else.

```
$ mv ./captain ~/.config/bspwm/captain
```

You then want to add `./captain/captain` to the bottom of your window managers rc
file to start Captain when you start your window manager. That is all there
needs to be done, restart and start customizing from here on.

-----

I would like to mention that the structure might still change in the future.
Right now the script heavily relies on having everything in the same
directory (`captain`, `captainrc`, `captain.d`). This is likely up for change to make
things more flexible.

## Customizing
Customizing easily is what Captain is all about. I'll quickly go over
the options available.

### Adding a new script
You can easily add scripts and have them display directly. No need to specify
any `while :; do` loops or `sleep` calls. That will all be done for you. If you
for example want to display the current window title, create the file
`captain.d/title` (the name is entirely up to you) and add:

```
xtitle `xdotool getactivewindow`
```

That's all! We can now start displaying it by making a section for in the
`captainrc` file.

### Displaying the script
There's 2 things we need to change for the script to display the way we want it
to. The first one is the `[bar] position` section. This determines where to
align the scripts.

```
# You can specify between 0 and 2 pipes (|), they act as logical delimiters.
# You can specify multiple scripts in the alignment by splitting them with a
# colon (:). There is no limit of scripts one can specify. You are also free to
# specify the same script multiple times.

# Display the clock on the right and on the left.
position = "clock||clock"

# Display the clock and the volume in the center and the battery on the left.
position = "battery|clock:volume"

# Display the windows on the left, the title in the middle and the rest on the right.
position = "windows|title|clock:volume:battery"
```

The second thing we need to do is add a new section for our script.

```
[title]
# The foreground color to use. The first 2 characters are the opacity, the
# remaining 6 display the color.
foreground = "#FF000333"

# The background color, uses the same syntax as the foreground color.
background = "#FF000BBB"

# Wheter to show the current section or not. It is preferred to use only boolean
# values, but it acts as an generalized boolean regardless.
display = true

# What events to trigger on a specific section. It currently relies on the
# values 0 to 5. You can read more about this in the lemonbar README.
events = "1:notify-send 'Hi'" "2:termite"

# How often to reload the script. I don't expect you want to reload to weather
# every 1 second, but this would be preferable on the volume.
reload = 1
```

If you do not set any of these, Captain will use default values for them. Keep
an eye on stdout to see what Captain didn't find to prevent unexpected
behaviour.

## Future
What will be changed or added in the (near) future?

* Possibly convert the file structure currently being used.
* Change the mouse event values to a human readable format.
* Remove the python3 dependency.
