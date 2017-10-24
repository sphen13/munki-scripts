## Outset packages

Collection of outset specific packages.  

These all depend on [outset](https://github.com/chilcote/outset) being installed on the computer.  If deploying munki you should import outset into your repo and use a requires array for each of these outset packages to satisfy any dependencies.

```<key>requires</key>
<array>
	<string>outset</string>
</array>
```