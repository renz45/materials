# Materials
Repo for an experiment in creating a ui for generating html based slide
presentations.

## Setting up a build system in sublime text 2.

Unzip the node-webkit.zip file and put the node-webkit app into your Applications folder

`Tools => build system => new build system`

Paste this into the window:

```json
{
  "cmd": ["node-webkit", "${project_path:${folder}}"],
  "working_dir": "${project_path:${folder}}",
  "path": "/Applications/node-webkit.app/Contents/MacOS/"
}
```

Open the index.html file and select: `Tools => Build`

The window should open up (check under your editor window)