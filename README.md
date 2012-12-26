MatlabMovieMaker
================

This MATLAB class is written for creating gif animations and record MATLAB plots. It is used after initialization and each time to add frame a method of the object is called. 

MM = MovieMaker("filename");
MM.path = "filepath";
MM.AddFrame();
MM.Save();

