---
layout: default
---
# Installing tools for compiling packages
When installing packages, R will sometimes ask for you to 'compile a package from the source code'. In order to do this, we need to install an extra tool. This tool differs depending on your operating system.

## Windows

1. Go to the [install page]() for RTools

2. Click the link to the latest version of RTools. Read the instructions under the heading **Installing RToolsXX** (XX is the version number). Find the installer link, which will begin downloading RTools, and note the following instruction:
   
   >It is recommended to use the defaults, including the default installation location of `C:\rtools44`.

3. After the download is finished, run the installer and follow the on-screen instructions, taking note of the above instruction

4.  To verify that you have installed RTools correctly, open RStudio and type `Sys.which("make")` into the console. Your console should spit something out like this: 

![verify rtools](https://raw.githubusercontent.com/tim9800/r_workshop_2024/master/img/syswhich.png)

## Mac

1. Go to spotlight search on the top right of your desktop (magnifying glass symbpol)

2. Search for **Terminal**

3. Copy and paste the following into the terminal, then press Enter:
```
xcode-select --install
```

4. Follow any on-screen instructions, which may include giving your password.

5. When it finishes, you are all done!
