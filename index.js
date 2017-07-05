#!/usr/bin/env node

const tama = require("tama-yaru");
const fs = require("fs");
const readline = require("readline");
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});
const tty_out = process.stdout;
if (process.argv.length != 3) {
    process.stderr.write("Usage: " + process.argv[1]
			 + " char.json\n");
    process.exit(1);
}

const json_in = process.argv[2];
tama.start(tty_out, fs.readFileSync(json_in));
rl.on('line', tama.handle);
