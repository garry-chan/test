------------------------------------------------------------------------------
                               BEGIN README.TXT
------------------------------------------------------------------------------

HTML5: Next Generation Web Development
Course 2320
Learning Tree International
www.learningtree.com

These are general instructions for setting up the case study to work on an
IIS or Apache install.  If you determine that anything is missing, please
contact the author, Andrew M. Andrews III, at www.ama3.com

The classroom environment uses three virtual machines, networked together,
to test the exercises in current production, development and legacy browsers.
These instructions do not explain how to create virtual machines or link
them together!

------------------------------------------------------------------------------
PREPARING YOUR ENVIRONMENT
------------------------------------------------------------------------------

You will need to perform the following tasks first, in order to create the
case study website(s).  The details of these tasks are beyond the scope of
this document.

(1) Install IIS or Apache web server.  If you are using IIS, be certain that
it is configured to use the .NET framework VERSION 4 (it is probably set to
version 2 by default).

(2) In the webserver configuration, set up the following virtual hosts, using
the same name for the host and web root directory.  For easiest results, 
place each web root within C:/2320.

        chirpinator
        dealingtree
        done-deal
        no-deal

(3) In the webserver configuration, set the correct MIME type for all of the
audio and video formats, as well as the WOFF (application/font-woff) format.

(4) The file drag-and-drop exercise (chapter 8) attempts to save image files
to the /added subdirectory when they are uploaded using the input type="file".
For each virtual host, you might have to grant write permission to the web
server for this directory (preferrably after unzipping the following file).

-----------------------------------------------------------------------------
THE ZIP FILE
-----------------------------------------------------------------------------

The ZIP file contains directories for the virtual hosts mentioned above. The
contents of each should be placed in the web root of the corresponding host.

The following files are placed on the desktop for use in the image file
drag-and-drop exercise (Chapter 8):

        PhotoFlowers.jpg
        PhotoGiftBox.jpg
        PhotoMarket.jpg

You might also find the following folders useful:

  contrib

This contains contributions from the author, technical editor and other
instructors that might (or might not) have been mentioned in class. Learning
Tree International assumes no responsibility for these contributions, which
are provided as-is with no guarantees! Instructors like to present their own
"value-added" material (such as these contributions) when they lead an event;
the material is not part of the course itself.  DO NOT CONTACT LEARNING TREE
INTERNATIONAL, THE AUTHOR, OR THE CONTRIBUTING INSTRUCTOR WITH QUESTIONS
ABOUT THIS MATERIAL!

  exercise-explorer

This contains the "HTML5 Exercise Explorer" HTA (HyperText Application) that
is used in class to edit the files corresponding to each exercise. It can be
launched by opening the exercise-explorer.hta file in Internet Explorer
(other browsers do not support HTA). The exercise-explorer.js script assumes
that all virtual hosts, as well as the exercise-explorer folder, are in the
folder C:/2320. If you place them somewhere else, you will need to change
the JavaScript code accordingly.

  wwwroot

The files in this folder should go in the web root directory of the default
web server.  It contains the course home page and the page of web references
mentioned in each chapter (references.html).

------------------------------------------------------------------------------
                                END README.TXT
------------------------------------------------------------------------------
