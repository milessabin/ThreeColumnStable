# XMonad.Layout.ThreeColumnStable

A three column layout for XMonad suitable for ultrawide monitors.

## Overview

This layout divides the workspace into a central column flanked by two
(typically slightly smaller) side columns. It populates the workspace starting
from the centre column, then fills the right column, then shifts all the
windows to the left and fills the newly empty right column. At this point all
columns are occupied and further new windows are inserted below the currently
focused window in the same column. Once initially populated in this way, the
layout behaves in a "stable" manner, meaning that windows will not be
automatically moved between or within columns as other windows are added or
removed.

Windows can be moved between columns using the `MoveWindow` message, and whole
columns can be moved left or right using the `MoveColumn` message. The
`RotateColumns` message rotates all three columns left or right. The
`TidyColumns` message packs the columns to the centre and right, leaving the
left column and possibly the right column empty if there are one or two columns
currently empty. If closing a window leaves a single window visible then it
will be moved to the centre column automatically.

![Animated layout demo](demo/tcs.apng "Animated layout demo")

`ThreeColumnStable` gets along well with `Xmonad.Actions.Navigation2D` and
`XMonad.Layout.PerWorkspace`.

It began its life as a modification of `XMonad.Layout.CenterMainFluid` which
works well on Ultrawide monitors but does have the drawback of assigning and
moving windows to columns unpredictably as windows are added or removed. This
layout attempts to avoid that in a hopefully intuitive way.

Some inspiriation for the implementation came from `XMonad.Layout.Columns` and
`XMonad.Layout.BinarySpacePartition` although I think it is quite a bit simpler
than either of those.

## Usage

Add the following to your `xmonad.hs`,

```haskell
import XMonad.Layout.ThreeColumnStable
import XMonad.Util.Types -- for Direction1D
```

Then add it in your `layoutHook` in an initially empty state,

```haskell
myLayout = threeColStable ||| Full
  where
    threeColStable = emptyTCS delta ratio
    ratio = 40/100
    delta = 3/100
```

The `ratio` argument controls the width of the central column relative to the
width of the display, with the rest of the space divided equally between the
two side columns. The `delta` argument controls the size of the change in size
of the central column using the `Shrink` and `Expand` messages.

### Window Management Messages

You can control the layout using the following messages,

#### Move Windows Between Columns
```haskell
-- Move focused window one column left/right
-- Bool parameter controls wrapping at edges
MoveWindow Direction1D Bool
```

#### Move Entire Columns
```haskell
-- Move the column containing the focussed window left/right
-- Bool parameter controls wrapping at edges
MoveColumn Direction1D Bool
```

#### Rotate All Columns
```haskell
-- Rotate all three columns left/right
-- Bool parameter controls wrapping at edges
RotateColumns Direction1D Bool
```

#### Tidy Columns
```haskell
-- Pack columns to center and right
TidyColumns
```

### Example Key Bindings

Add the following or similar to your key bindings,

```haskell
-- Move windows between columns
, ((modm .|. shiftMask, xK_Left ), sendMessage $ MoveWindow Prev True)
, ((modm .|. shiftMask, xK_Right), sendMessage $ MoveWindow Next True)

-- Move columns
, ((modm .|. controlMask, xK_Left ), sendMessage $ MoveColumn Prev True)
, ((modm .|. controlMask, xK_Right), sendMessage $ MoveColumn Next True)

-- Rotate columns
, ((modm .|. mod1Mask, xK_Left ), sendMessage $ RotateColumns Prev True)
, ((modm .|. mod1Mask, xK_Right), sendMessage $ RotateColumns Next True)

-- Tidy columns
, ((modm .|. shiftMask, xK_t), sendMessage TidyColumns)
```

## License

3-Clause BSD License
