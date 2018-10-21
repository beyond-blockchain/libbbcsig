Library of ECDSA for BBc-1 transaction data
====
This library is originally from [BBc-1 repository](https://github.com/beyond-blockchain/bbc1), which is the library for signing/verifying BBc-1 transaction. 
When porting bbclib.py to another programming language, the dynamic link library generated in this project will be helpful.

# preparation (Linux/Mac)
```
sh prepare.sh
```
After finishing prepare.sh script, you will find libbbcsig.so (for Linux/Windows) or libbbcsig.dylib (for Mac) in lib/ directory.

# preparation (For AWS)
For Amazon Lambda/EC2, you need docker and do the following:
```
sh prepare.sh aws
```
After finishing prepare.sh script, you will find libbbcsig.so in the ami-docker/ directory.

