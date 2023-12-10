# Nomad
## Automate ComfyUI on a remote server

I find it hard to work with ComfyUI on a remote server. This is a script to automate the process of setting up a remote server for ComfyUI.

## Features

- Pull data from R2
- Install `python3.10` and dependencies needed
- Setup venv
- Install extension dependencies inside custom_nodes
- Setup tailscale with ssh for remote access
- Push data to R2

## Installing

Clone this repository to your computer

Copy `.env.example` to `.env` and fill in the variables

```bash
cp .env.example .env
```

Change ownership of the scripts to be executable

```bash
chmod +x nomad
chmod +x ./scripts/*
```

## Usage

```bash
./nomad <command>
```

## Commands

### `./command ssh`

This command do the following:

- Copy the .env file to the remote server
- Clone nomad repository to the remote server
- SSH into the remote server

You are now ready to run the other commands on the remote server!

### `./command setup`

### `./command start`

### `./command backup`

### `./command restore`


## What's next?

- [ ] Sync the config files with R2
- [ ] Update nomad
