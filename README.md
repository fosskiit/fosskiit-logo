FOSS@KIIT Logo and Favicon
==========================
This project contains SVG images for the FOSS@KIIT logo and favicon and
a few make targets to generate the corresponding PNG images.


Contents
--------
* [Development Environment](#development-environment)
* [Original KIIT Logo](#original-kiit-logo)
* [FOSS@KIIT Logo](#fosskiit-logo)
* [FOSS@KIIT Favicon](#fosskiit-favicon)
* [Generate PNGs](#generate-pngs)
* [Copyright](#copyright)


Development Environment
-----------------------
The logo and the favicon are developed with Inkscape 0.92 on macOS
Sierra 10.12.6. Inkscape may be installed on Mac using brew with the
following command:

    brew cask install xquartz inkscape

The sections below document how the logo and favicon are developed. The
steps in the sections below should work fine in any environment as long
as there is Inkscape.

There is a [Makefile][MAKEFILE] in this project that contains a few
targets to generate PNGs from the SVGs. The `make` command is required
to run these targets.

[MAKEFILE]: Makefile


Original KIIT Logo
------------------
Both the logo and the favicon have been derived from the original KIIT
University logo. The origial KIIT University logo was obtained from
a [Wikipedia file entry][WPFILE] with the
[original 387 x 294 SVG][WPORIG] image of the logo.

![Original KIIT Logo][ORIGLOGO]

[WPFILE]: https://en.wikipedia.org/wiki/File:KIIT_logo.svg
[WPORIG]: https://upload.wikimedia.org/wikipedia/en/e/ef/KIIT_logo.svg
[ORIGLOGO]: kiit.svg


FOSS@KIIT Logo
--------------
We create the FOSS@KIIT logo by simply adding the text "FOSS" enclosed
in a green rectangle just above the original KIIT logo. The green color
chosen for the rectangular box is the same shade of malachite green
that is used in the original KIIT logo.

![FOSSKIIT Logo][FOSSLOGO]

Note that the malachite green used in the KIIT logo (hex code #17d059)
is a slightly darker shade of the actual malachite green (hex code #0bda51).

![Malachite Shades Comparison][MALACHITE]

Here are the steps to create the logo with Inkscape:

 1. Open [kiit.svg][ORIGLOGO] in Inkscape.
 2. Add a rectangle above the KIIT logo. Align its left edge with the
    left edge of "K" of KIIT. Align its right edge with the right edge of
    "T" of "KIIT". Set its height to 76 px.
 3. Set the fill color of the rectangle to flat color 17d059ff (RGBA)
    via *Object* > *Fill and Stroke*.
 4. Click on *Edit paths by nodes* tool, then select the round node on
    the top-right corner of the the rectangle and drag it down to make
    rounded corners.
 3. Add a text object and write "FOSS" in it.
 4. Set the font of the text to sans-serif bold face and the font size
    to 48 via *Text* > *Text and Font*.
 5. Select the rectangle and the text object, center on vertical
    axis, and center on horizontal axis via *Object* > *Align and Distribute*.
 6. Go to *File* > *Document Properties* > *Custom Size* > *Resize page
    to content*. Then set the margins such that the top and bottom
    margins are equal, the left and right margins are equal and the size
    of the image is 420 x 420.
 7. Save the image as [fosskiit-base.svg][BASELOGO]

The image [fosskiit-base.svg][BASELOGO] is an intermediate file that is
used in the steps below to develop the finished logo,
[fosskiit.svg][FOSSLOGO]. The reason we save this intermediate file is
that this intermediate file contains the text and the rectangle as
separate objects. Therefore they can be edited separately if needed in
future. However the finished logo does not contain the text as a
separate object; instead the text is cut out from the green rectangle
such that the text is replaced with transparent background. As a result,
in the finished logo, the text cannot be edited anymore. Therefore
whenever we need to edit the text again in future, we need the
intermediate file.

Now we create the finished logo as per the following steps:

 1. Open [fosskiit-base.svg][BASELOGO] in Inkscape.
 2. Select the rectangle and the text objects.
 3. From the menu, select *Path* > *Difference*.
 4. Save the image as [fosskiit.svg][FOSSLOGO].

[BASELOGO]: fosskiit-base.svg
[FOSSLOGO]: fosskiit.svg
[MALACHITE]: malachite.svg


FOSS@KIIT Favicon
-----------------
The favicon is simpler than the logo. The simplicity is necessary
because the icon should look neat even when scaled down to very small
sizes. In fact, Firefox and Chrome scale the favicon size down to
16 x 16 while displaying it in browser tabs. At this tiny scale, any
text in the image becomes illegible.

We remove text from the KIIT logo, then duplicate, flip and position
the half gear icon to make a full round gear icon.

![FOSS@KIIT Favicon][FAVICON]

[FAVICON]: favicon.svg

A nice side-effect of this favicon is that the resulting icon resembles
"O" which may be thought to represent "open source".

Here are the steps to create the favicon:

 1. Open [kiit.svg][ORIGLOGO] in Inkscape.
 2. Remove the object that spells out "KiiT" from the image.
 3. Select all remaining objects.
 4. Then duplicate all selected objects via *Edit* > *Duplicate*.
 5. Flip all selected objects vertically via *Object* > *Flip Vertical*.
 6. Go to *Edit* > *Preferences* > *Behavior* > *Steps* and set *Arrow
    keys move by* to 1 px. This allows us to move the flipped objects in
    smaller steps and place it carefully above the unflipped objects.
 7. Move the flipped objects with up and down arrow keys such that they
    fit neatly on top of the unflipped objects to make a nice round
    icon.
 6. Resize the image to the size of the content (Go to *File* >
    *Document Properties* > *Custom Size* > *Resize page to content*.
    Then set the margins such that the top and bottom margins are equal,
    the left and right margins are equal and the size of the image is
    380 x 380.
 7. Save the image as [favicon.svg][FAVICON].


Generate PNGs
-------------
The SVG image sources are converted to PNG images before we upload them
to various locations on the Internet. We generate three images:

  - fosskiit.png: For general use, such as, on GitHub, LinkedIn, etc.
  - fosskiit-xpad.png: For use on websites that crop the image to a
    round circle. This image contains additional padding on all sides to
    ensure that such cropping does not lead to loss of visible content.
  - favicon.png: For website favicon.

Here are the steps to generate these PNG files and preview them:

 1. Enter the following command to generate the PNG images from the SVG
    sources.

        make

 2. If Python is installed on the current system, enter the following
    command to preview the images on light as well as dark backgrounds.

        make preview

    Then visit http://localhost:8000/preview.html to preview the images.

 3. If Python is not installed, then just open [preview.html][PREVIEW]
    with a web browser.

[PREVIEW]: preview.html


Copyright
---------
Copyright (c) 2018 KIIT University  
All Rights Reserved.

The logo and favicon in this project and the images generated by this
project are trademarks of Kalinga Institute of Industrial Technology
(KIIT).
