# Paparazzi Office Infrastructure

## Prerequisite

* [mikrocfg](https://github.com/AenonDynamics/mikrocfg)
* [pwgen](https://github.com/tytso/pwgen)
* [docker](https://www.docker.com/)

## Installation

### 0. Setup

#### Create secrets

##### Mikrotik

Clone the example secrets:
```shell
mkdir -p secrets/mikrotik
cp secrets.example/mikrotik/* secrets/mikrotik/
```

Edit the secrets [secrets/mikrotik/wifi-ap.rsc](secrets/mikrotik/wifi-ap.rsc) to match your environment.

**Hint:** Use `pwgen -cnsB 32` to generate random passwords.

### 1. Router

Apply the configuration using mikrocfg:
```shell
pushd 
cd config/mikrotik
mikrocfg apply wifi-ap
popd 
```
