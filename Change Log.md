### 2025-01-05, Version 2.15 ###

Fixed bug which occurred when attempting to create a new method and invoking GoToDef too quickly after the closing paren.

### 2023-10-07, Version 2.14C ###

Fixed bug when using file name that is a relative path.

### 2023-10-07, Version 2.14B ###

Fixed bug in v2.14 when using GTD on an object created by an assignment using NewObject or CreateObject

### 2023-09-29, Version 2.14 ###

Using GTD on an object created by an assignment using NewObject or CreateObject now goes directly to the object, rather than the assignment.

### 2023-09-24, Version 2.13B ###

Fix bug with handling of LOCAL, PRIVATE, and PUBLIC statements

### 2023-08-15, Version 2.13 ###

Add new property .AppID to all tools to identify the project they originate in.

### 2023-05-25, Version 2.12 ###

Enhancement to handle:   PUBLIC SomeName AS type OF ClassLib

### 2023-05-22, Version 2.11 ###

Bug fix: bookmarks failed on windows where code is edited ('*' in the titlebar)

### 2023-04-15, Version 2.10 ###

- Search for variables in current procedure (assignments and index assignments)
- Search for cursor creation in current procedure
- VFP keyword search (click on first keyword)
    - Do 
    - Do Form
    - Report Form
    - NewObject
    - CreateObject
    - Local VarName as Class of Classlib
    - Define Class ClassName1 AS ParentClass [OF ClassLibrary] 

### 2023-03-19, Version 2.015 ###

* Fix to issue #3, where GTD was no longer sensitive to context for DO FORM

### 2023-03-16, Version 2.014 ###

* Fix to issue #3, where GTD was no longer sensitive to context for DO FORM

### 2023-03-11, Version 2.013 ###

* Fix: When using form to add new PEMs and entering the description, all characters typed were doubled.

### 2023-02-17, Version 2.012 ###

* Position and size of form to add new PEMs is persistent.

### 2023-02-15, Version 2.01 ###

* Bug fix for this problem:  Type This.Something(), then press F12, nothing happens.  (Form to add new PEM was not included in download)

### 2023-02-04, Version 2.0 ###

This version is a complete refactoring of the original Go To Definition (GTD). The code was created before we had Thor, so it was embedded into the older PEMEditor App. This, along with the fact that GTD evolved incrementally over a long period of time, made it a prime candidate for refactoring. GTD is now a standalone tool, simplifying the tasks of updating or documenting. All of the original features of GTD should work as they have always had, with the following enhancements:

*  [IntelliSenseX (ISX)](https://github.com/VFPX/IntelliSenseX) provides dropdown lists for PEMs (properties, events, and methods) for objects referenced in code.  GTD now uses ISX in two new ways:
    * If ISX can provide a dropdown list of PEMs for an object, then using GTD will open the definition of that object.  
    * In addition, GTD will open an object's definition and associated method code if you use GTD on a method from the object.  
        
> This is especially useful for objects described in the "Hidden gems" section in [Thor News Item 47](https://github.com/VFPX/Thor/blob/master/Docs/NewsItems/Item_47.md).


* GTD now creates bookmarks each time it is used, one placed where GTD was invoked and one at its destination (if in a code window).  Two Thor tools work with these bookmarks
    * **Cycle Bookmarks** takes you through all your current bookmarks.
    * **Add/Remove BookMark** will add a bookmark at the current location if there isn't one there or remove the current bookmark if there is.
    
> Bookmarks are defined by the window (not its contents) and the cursor position in that window.  They are automatically removed when the window is closed.  Also, they may be out of sync if the code in the window above the bookmark cursor position has been modified.

* If you use GTD on the name of an object that actually exists (other than in the SCX or VCX you are editing), GTD will open **Object Explorer**. An example (although not a very useful one), would be to use GTD on _Screen.
* GTD would seemingly have nothing to do if the active window is not a code window (the  form or class you are editing, the Property Window, Class Browser, PEM Editor, etc) or if the cursor is in white space in a code window.  In these cases, the "Add new PEM" window is opened.
--- 
Last changed: _2023-04-15_

![Picture](./documents/Images/vfpxpoweredby_alternative.gif)

