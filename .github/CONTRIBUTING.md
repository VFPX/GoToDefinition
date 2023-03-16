# How to contribute to GoToDefinition

## Bug report?
- Please check [issues](https://github.com/VFPX/ObjectExplorer/issues) if the bug is reported
- If you're unable to find an open issue addressing the problem, open a new one. Be sure to include a title and clear description, as much relevant information as possible, and a code sample or an executable test case demonstrating the expected behavior that is not occurring.

### Did you write a patch that fixes a bug?
- Open a new GitHub merge request with the patch.
- Ensure the PR description clearly describes the problem and solution.
  - Include the relevant version number if applicable.
- See [New version](#new-version) for additional tasks

## New version
Here are the steps to updating to a new version:

1. Fork the project: see this [guide](https://www.dataschool.io/how-to-contribute-on-github/) for setting up and using a fork.

1. Make whatever changes are necessary. The source code for GoToDefinition is in the InstalledFiles folder.

1. If you haven't already done so, install VFPX Deployment: invoke menu item  **Thor -> Check For Updates**, turn on the checkbox for VFPX Deployment, and click Install.

---
4. Edit the Version setting in _BuildProcess\ProjectSettings.txt_.
1. Update the version and date in _README.md_.
1. Describe the changes in the top of _Change Log.md_.
1. Run the VFPX Deployment tool to create the installation files by
    -   Invoking menu item  **Thor Tools -> Applications -> VFPX Project Deployment**  
    -   Or executing Thor tool **"VFPX Project Deployment"**
    -   Or executing ```EXECSCRIPT(_screen.cThorDispatcher, 'Thor_Tool_DeployVFPXProject')``` 
---
8. Commit
9. Push to your fork
10. Create a pull request

---
Last changed: _2023/03/11_ ![Picture](../documents/Images/vfpxpoweredby_alternative.gif)
