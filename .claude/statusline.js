#!/usr/bin/env node
"use strict";
const { execSync } = require("child_process");

const data = JSON.parse(require("fs").readFileSync("/dev/stdin", "utf8"));

const BLOCKS = " ▏▎▍▌▋▊▉█";
const R = "\x1b[0m";
const DIM = "\x1b[2m";

function gradient(pct) {
  if (pct < 50) {
    const r = Math.round(pct * 5.1);
    return `\x1b[38;2;${r};200;80m`;
  }
  const g = Math.max(200 - Math.round((pct - 50) * 4), 0);
  return `\x1b[38;2;255;${g};60m`;
}

function bar(pct, width = 10) {
  pct = Math.min(Math.max(pct, 0), 100);
  const filled = (pct * width) / 100;
  const full = Math.floor(filled);
  const frac = Math.floor((filled - full) * 8);
  let b = "█".repeat(full);
  if (full < width) {
    b += BLOCKS[frac];
    b += "░".repeat(width - full - 1);
  }
  return b;
}

function fmt(label, pct) {
  const p = Math.round(pct);
  return `${label} ${gradient(pct)}${bar(pct)} ${p}%${R}`;
}

function gitBranch() {
  const cwd =
    (data.workspace && data.workspace.current_dir) || data.cwd || undefined;
  try {
    const branch = execSync("git branch --show-current", {
      cwd,
      timeout: 2000,
      stdio: ["ignore", "pipe", "ignore"],
    })
      .toString()
      .trim();
    if (branch) return branch;
    const short = execSync("git rev-parse --short HEAD", {
      cwd,
      timeout: 2000,
      stdio: ["ignore", "pipe", "ignore"],
    })
      .toString()
      .trim();
    return short ? `HEAD:${short}` : null;
  } catch {
    return null;
  }
}

const model = (data.model && data.model.display_name) || "Claude";
const parts = [];

const branch = gitBranch();
if (branch) {
  const BRANCH_COLOR = "\x1b[38;2;100;180;255m";
  parts.push(`${BRANCH_COLOR}\ue0a0 ${branch}${R}`);
}

parts.push(model);

const ctx =
  data.context_window && data.context_window.used_percentage;
if (ctx != null) parts.push(fmt("ctx", ctx));

const five =
  data.rate_limits &&
  data.rate_limits.five_hour &&
  data.rate_limits.five_hour.used_percentage;
if (five != null) parts.push(fmt("5h", five));

const week =
  data.rate_limits &&
  data.rate_limits.seven_day &&
  data.rate_limits.seven_day.used_percentage;
if (week != null) parts.push(fmt("7d", week));

process.stdout.write(parts.map((p) => ` ${p} `).join(`${DIM}│${R}`));
