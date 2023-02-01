
### 2023-02-04, Version 2 ###

This version is a complete refactoring of the original Go To Definition (GTD). The code was created before Thor, so was embedded into the older PEMEditor App. This, along with the fact that GTD evolved incrementally over a long period of time, made it a prime candidate for refactoring. GTD is now a standalone tool, simplifying the tasks of updating or documenting. All of the original features of GTD should work as they have always had, with the following enhancements:

* [IntellisenseX (ISX)](..\IntelliSenseX\README.md) provides dropdown lists for PEMs (properties, events, and methods) for objects referenced in code.  GTD now uses ISX in two new ways:
    * If ISX could provide a dropdown list of PEMs for an object, then using GTD will open the definition of that object.  
    * If there is a reference to a method for an object where ISX could provide a dropdown list of PEMs for an object, then using GTD on that method will open the definition of that object and the associated method code.
    
> This is especially useful for objects described in the "Hidden gems" section in [Thor News Item 47](../Thor/Docs/NewsItems/Item_47.md)

* GTD now creates bookmarks each time it is used, one for where GTD was invoked and one for its destination (if in a code window).  Two Thor tools work with these bookmarks
    * **Cycle Bookmarks** takes you through all your current bookmarks.
    * **Add/Remove BookMark** will add a bookmark at the current location if there isn't one there or remove the current bookmark if there is.
    
> Bookmarks are defined by the window (not its contents) and the cursor position in that window.  They are automatically removed when the window is closed.  Also, they may be out of sync if the code in the window before the bookmark cursor position has been modified.

* If you use GTD on name of an object that actually exists (other than in the SCX or VCX you are editing), GTD will open **Object Explorer**. An example (although not a very useful one), would be to use GTD on _Screen.
* GTD would seemingly have nothing to do if the current window is not a code window (Property Window, Class Browser, PEM Editor, etc) of if the cursor is in white space in a code window.  In these cases, the "Add new PEM" window is opened.
--- 
Last changed: _2023-02-04_ ![Picture](./documents/Images/vfpxpoweredby_alternative.gif)
