#datatorrent-sandbox-generator

Welcome to the datatorrent sandbox generator!  Here, you'll find instructions for creating a virtual machine image with datatorrent preinstalled on various of Hadoop distributions.

By creating your sandbox in this way, you'll have a repeatable process that can be leveraged each time you come out with a new version of datatorrent, or other Hadoop distributions release a new version.

###Step 0 - Get Packer
[Packer] www.packer.io is a useful tool for automating the process of creating VM images, and it's what we use to create our sandbox. Installation is very straightforward. You can just download the latest version and unzip to any folder and put it in your PATH environment variable

On linux
```
export PATH=$PATH:~/packer/
```
On windows
```
set PATH=PATH;C:\\...\\packer\\
```
When you use packer on windows it can only be used on power shell

###Step 1 - Clone this repository
```
cd ~/
git clone git://github.com/siyuanh/datatorrent-sandbox-generator
cd datatorrent-sandbox-generator
```

###Step 3 - Download the hadoop distribution sandbox
MapR - http://package.mapr.com/releases/

###Step 4 - Download the datatorrent installation file
https://www.datatorrent.com/download/

###Step 5 - Create the VM
```
packer build -var 'distro_sandbox=\your\hadoop\distro\MapR-Sandbox-For-Hadoop-4.1.0.ova'  -var 'dt_file=your\datatorrent\release\datatorrent-rts-community-3.0.0.bin' partner-sandbox.json
```
