#!/usr/bin/env node

const { exec } = require('child_process');


const exts = [
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.gif",
    "*.webp",
    "*.psd",
    "*.ai",
    "*.dwg",
    "*.svg",
    "*.bmp",
    "*.pdf",
    "*.odf",
    "*.txt",
    "*.ttf",
    "*.rtf",
    "*.chm",
    "*.pptx",
    "*.key",
    "*.wps",
    "*.xps",
    "*.epub",
    "*.xlsx",
    "*.doc",
    "*.docx",
    "*.odt",
    "*.numbers",
    "*.mobi",
    "*.mp3",
    "*.flac",
    "*.wma",
    "*.aac",
    "*.quicktime",
    "*.mp4",
    "*.mov",
    "*.m4v",
    "*.flv",
    "*.f4v",
    "*.swf",
    "*.avi",
    "*.rm",
    "*.rmvb",
    "*.mkv",
    "*.wmv",
    "*.wav",
    "*.ogg",
    "*.webm",
    "*.dmg",
    "*.exe",
    "*.pkg",
    "*.apk",
    "*.ipa",
    "*.jar",
    "*.zip",
    "*.zipx",
    "*.rar",
    "*.iso",
    "*.out",
    "*.7z",
    "*.rz",
    "*.zz",
    "*.tgz",
    "*.tar.gz",
]

const attrs = exts.join(',');

const trackAll = () => {
    const cmd = `git lfs track "${attrs}"`;
    // console.log(cmd)
    
    exec(cmd, (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return;
        }
        if (stderr) {
            console.error(`exec error: ${stderr}`);
            return;
        }
        console.log(`exec success: ${stdout}`);
    });
}

const migrateAll = () => {
    const cmd = `git lfs migrate import --everything --include="${attrs}"`;
    // console.log(cmd)
    
    exec(cmd, (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return;
        }
        if (stderr) {
            console.error(`exec error: ${stderr}`);
            return;
        }
        console.log(`exec success: ${stdout}`);
    });
}
trackAll();
migrateAll();