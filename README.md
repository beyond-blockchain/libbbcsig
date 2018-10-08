Library of ECDSA for BBc-1 transaction data
====
This repository is copied from bbc1 and bbclib-go.
In the next version 1.1 of bbc1, libbbcsig will be decoupled.

# preparation (Linux/Mac)
```
sh prepare.sh
```
After finishing prepare.sh script, you will find libbbcsig.so (for Linux) or libbbcsig.dylib (for Mac) in lib/ directory.

# preparation (For AWS)
For Amazon Lambda/EC2, you need docker and do the following:
```
sh prepare.sh aws
```
After finishing prepare.sh script, you will find libbbcsig.so in the ami-docker/ directory.

