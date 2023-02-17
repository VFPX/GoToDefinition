# GoToDefinition

Version 2.011 Released 2023-02-17

[What's new in this release](Change%20Log.md)

*** 


## Introduction
Go To Definition (GTD), modeled after "Go to Definition" (F12) in Visual Studio, allows you to point to a name that is referenced in your code, and go to (that is, display and/or edit) its definition. It can also be used to create new methods and properties in a form or class.
The mechanics are simple:
* Click on the name (in almost all cases, no need to highlight it.)
* Run GTD. 

The intent of GTD is that it can search for any name where you can imagine that a definition could be found programmatically; that is, without reading your mind.  And there's no penalty (other than a few wasted seconds) if it's unsuccessful.


### What's in a name?
The “name” that is searched for is determined as follows:
1. All characters to the right of the cursor (or of the selected text, if any) that can be part of a name (letters, numbers, and underscore) are included. 
2. All characters to the left of the cursor (or of the selected text, if any) that can be part of a name, _including periods_, are included. 
3. If the leftmost character is a period and is only preceded by whitespace, then the preceding code is examined looking for WITH statements.  This is done repeatedly, handling embedded WITHs. 

The effect is that you can simply click before the first character of the name, after the last character, or any place in between. GTD will look for the appropriate Property or method, even when the reference is inside a With statement.

 The example below demonstrates all of these rules, as the name being searched for is `This.Frame.Pg1.cboStates`.

![](documents/Images/Embedded%20Withs.png)

#### What you can search for


* Simple names (that look like valid variable names):
	* File name with any of these extensions
		* PRG
		* SCX
		* VCX
		* FRX
	* Name of a procedure or function in a PRG
	* Alias of a table that is open
	* Alias of a table that can be opened (possibly augmented by customization)
	* Name of an existing object
	* Name of an object defined by any of:
		* NEWOBJECT
		* CREATEOBJECT
		* LOCAL
	* Name of an object defined in Alias Dictionary
	* Constants (from #Include and #Define)
	* Local variables _(Not Yet Implemented, under consideration)_
 
* VFP Keywords
	* NEWOBJECT
	* CREATEOBJECT
	* LOCAL
	* DEFINE CLASS
	* DO PRG  _(Not Yet Implemented, under consideration)_
	* Do FORM  _(Not Yet Implemented, under consideration)_
	* REPORT FORM  _(Not Yet Implemented, under consideration)_
 
* THISFORM and THIS (interchangeable)
	* THISFORM
	* THISFORM.SomeProperty
	* THISFORM.SomeNewProperty
	* THISFORM.SomeMethod
	* THISFORM.SomeNewMethod
	* THISFORM.SomeNewMethod(parameters)
	* THISFORM.SomeControl
	* THISFORM.SomeControl.SomePropertyOrMethod
 
* Object.MethodName  
    * Name of an object that is open
	* Name of an object defined by any of:
	    * NEWOBJECT
		* CREATEOBJECT
		* LOCAL
	* Name of an object defined in Alias Dictionary
 
For file names with special characters (extension, drive, backslash, etc.), the entire file name must be highlighted (and you can include the quotes.)


#### Where does it look?

GTD looks in many locations, including:
*   The current code window
*   The current folder
*   The search path
*   The active project, if any
*   Thor Tools, Procs, and "My Tools" folders
*   "Set ClassLib"
*   "Set Procedure"
*   #Include files (possibly nested)
*   (and possibly more)

#### Name Conflicts

In some cases, a name being searched for may not be unique.  You might, for instance have a table named "Admin", as well as a form, report, class, and class library of the same name.  GTD will stop searching after the first one it finds.

#### Search Order

GTD searches in a way similar to how people might search for things --
1. Searches that don't take too long.
2. Searches for things you're most likely to be looking for. 

This is tempered somewhat by a few cases where the searches must be done in a specific order.

#### Confusion with "ThisForm" and "This"

Unfortunately, for code windows within VCXs and SCXs, there is not much information that can be gleaned about the origin of the window, other than what is available in the titlebar. GTD may misbehave in a couple of different ways due to this problem:
*   If you have more than one VCX or SCX open, it's not possible to determine which VCX or SCX a code window belongs to (!)  GTD assumes that it belongs to the "active" one that shows up in PEMEditor or the Property Window.
*   The only information available to understand what "This" refers to is in the method's titlebar. If the name in the titlebar is not unique, GTD may use the incorrect object.

Incidentally, these same problems occur in [IntelliSenseX](https://github.com/VFPX/IntelliSenseX).

#### Bookmarks (leaving breadcumbs)
 GTD creates bookmarks each time it is used, one placed where GTD was invoked and one at its destination (if in a code window).  Two new Thor tools work with these bookmarks:
 * **Cycle Bookmarks** takes you through all your current bookmarks.
 * **Add/Remove BookMark** will add a bookmark at the current location if there isn't one there or remove the current bookmark if there is.
 
 Bookmarks are defined by the window (not its contents) and the cursor position in that window.  They are automatically removed when the window is closed.  Also, they may be out of sync if the code in the window above the bookmark cursor position has been modified.

#### Origins
This project began in early 2010 when Matt Slay suggested to Jim Nelson that a tool Matt had seen in Visual Studio, using F12 for "Go To Definition", might be of value if implemented in FoxPro.  It evolved along a familiar path, with concepts and enhancements coming from continual discussions between Matt and Jim, and eventual implementation by Jim.

> Author's note: I call this tool **"What's This?"** / Jim

[What's new in this release](Change%20Log.md)

----
## Helping with this project
See [How to contribute to GoToDefinition](.github/CONTRIBUTING.md) for details on how to help with this project.

Last changed: _2023-02-17_ ![Picture](./documents/images/vfpxpoweredby_alternative.gif)
