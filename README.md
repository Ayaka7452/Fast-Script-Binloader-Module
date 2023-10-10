# Fast-Script-Binloader-Module
a binloader applet that lets us running custom scripts in terminal rapidly with one command at Android terminal emulator
# Installation
Step 1 - Unlock your Android phone, make sure binloader module is installed via Magisk;<br>
Step 2 - Launch terminal emulator app, type 'bpkg install [PACK_PATH]';<br>
Step 3 - Reboot and finished.
# Usage
Access the applet via terminal emulator by typing 'fs [SCRIPT_NAME]' to run your own scripts rapidly,<br>
For scripts, put them at /sdcard/.scripts. For safety reason, 'rm' is not allowed to run via fs.<br>
For some scripts which required user access only, we can put '#req_user' mark to the script, the <br>
script will be limited at user privilege(termod ext.). Use '#req_root' mark to limit it to superuser privilege.<br>
# Termux Extension
Use termod mode to run scripts in user privilege. Make sure Termod mod manager is installed, then <br>
type 'fs tmfs', fs will be installed to Termux, then we can use fs to run scripts in user privilege.
# About This Program
Just an applet with a simple function, the developer does NOT responsible for any kind of risks caused<br>
by using this applet.
