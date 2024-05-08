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
    "*.wv",
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
console.log('attrs are: ', attrs);

const trackAll = () => {
    const cmd = `git lfs track "${attrs}"`;
    
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
    // const cmd1 = `git lfs migrate import --above=100Kb`; // only above 100kb file can be migrated
    
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

// 撤销 LFS 迁移
// 处于暂存区的时候，直接执行：git lfs prune
const revertMigration = () => {
    const cmd = `git lfs migrate export --everything --include="*"`;
    
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


// 以下命令不能同时执行，先这样吧...

// trackAll();
migrateAll();
