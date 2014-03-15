<?php
require_once('/autodeploy/class.GitHubHook.php');

// Initiate the GitHub Deployment Hook
$hook = new GitHubHook;

// Enable the debug log, kindly make `log/hook.log` writable
$hook->enableDebug();

$hook->addBranch('master', 'development', '/home/bootstrapdev');
$hook->addBranch('staging', 'staging', '/home/bootstrapstaging');
$hook->addBranch('production', 'production', '/home/bootstrap');

// Deploy the commits
$hook->deploy();